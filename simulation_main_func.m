function simulation_results_and_inputs = simulation_main_func(input_parameters, input_files_paths, progressFcn, number_of_cycles, outerloop, season)

    % An open source tool to simulate the integration of EVs into grids with
    % high penetration of renewable energy for the purpose of energy storage
    close all
    clear f_solar_generation f_wind_generation f_load_profile mismatch a b
    clear i j installed_wind_capacity installed_solar_capacity month_of_the_year
    clear number_of_days number_of_EVs netload_baseline load_scaling_factor
    clear commercialPB_preinterpolated_weekday homePB_preinterpolated_weekday employeePB_preinterpolated_weekday
    clear commercialPB_preinterpolated_weekend homePB_preinterpolated_weekend employeePB_preinterpolated_weekend
    clear charging_eff charging_rate EV_energy_economy baseline_buffer peak_load
    clear load_profile_data_weekday f season_weektime
    clear weekend_flag weekday_flag weekday_counter
    clear charge_limit discharging_limit
    
    number_of_days = input_parameters{9};
    installed_solar_capacity = input_parameters{6}; % 2600; % MWp
    installed_wind_capacity = input_parameters{7}; % MWp
    netload_baseline = input_parameters{8}; % kW
    %delayed_discharge = false;
    %priority_charge = false;
    baseline_buffer = input_parameters{10}/100; % 0.025 % priority charge / delayed discharge window (e.g. 0.1 is 10% of baseline generation) 
    PCW = input_parameters{11}/100; % 0.05;
    DDW = input_parameters{12}/100; % 0.05;
    allowed_unsubscriptions = input_parameters{13}; % 4; % allowed unsubscriptions per month for each EV
    
    % set month for renewables profiles
    month_of_the_year = input_parameters{14};
    limitEVCharging_to_renewables = false;
    charging_eff = input_parameters{15}/100;
    discharging_eff = input_parameters{16}/100;
    % EV_energy_economy = 0.188; % kWh/km (now replaced with energy_effeciency array) 
    
    % Reduce number of simulated EVs by a factor of x
    % But each EV will have x times larger battery, longer avg. travelled distance, higher charge/discharge rate, higher capex investment
    clustering_factor = input_parameters{2};
    number_of_EVs = round(input_parameters{1}/clustering_factor);   %150000/clustering_factor;        
    charge_limit = input_parameters{17};
    discharge_limit = input_parameters{18};
    charging_rate = input_parameters{19} * clustering_factor; % kW
    discharging_rate = input_parameters{48} * clustering_factor; % kW
    yearly_degradation_rate = input_parameters{20}/100; % 0.03; % the rate at which EVs will have to be added to counteract capacity loss
        
    min_charge = 5;
    CCGT_min_load = input_parameters{40}/100;

    % LCOS parameters
    FCR = 0.2; % capital recovery factor
    charging_points_per_EV = input_parameters{21}; %1.5;
    V2G_charger_capex = input_parameters{22};
    CAPEX_V2G = charging_points_per_EV*V2G_charger_capex*clustering_factor; % infrastructure cost in USD per EV
    kWh_compensation = input_parameters{23}; % kWh free per kWh discharged
    LCOE = input_parameters{24}; % 0.07; % $/kWh average LCOE
    
    % CCGT_FCR = 0.08; % over 25 or 30 years
    CCGT_CAPEX = input_parameters{25}; %1.5E+3; % $/kW
    % SCGT_FCR = 0.08; % over 25 or 30 years
    SCGT_CAPEX = input_parameters{26}; % 0.6E+3; % $/kW
    Peaking_premium = input_parameters{27}; % $/kWh
    
    CAPEX_BESS = input_parameters{28}; % $/kWh
    BESS_ONM = input_parameters{49}; % $/kWh/yr
    BESS_yearly_degradation_rate = input_parameters{39}/100;
    
    % for V2G fleet NPV calculation
    discount_rate = input_parameters{29}/100;
    PP_life_span = input_parameters{30};
    V2G_life_span = input_parameters{47};
    CCGT_ONM = input_parameters{31}; %15; % yearly maintenance per kW
    SCGT_ONM = input_parameters{32}; % 15; % yearly maintenance per kW
    existing_CCGT = 1000*input_parameters{50}; % kW
    existing_SCGT = 1000*input_parameters{51}; % kW

    charger_replacement_rate = input_parameters{33}/100; % 0.05; % yearly cost of maintaining or replacing chargers as a fraction of the charger price
    
    % BESS parameters
    % number_of_EVs_BESS = 150000/clustering_factor;
    BESS_capacity = input_parameters{3}; % ((CAPEX_V2G*number_of_EVs_BESS)/CAPEX_BESS); % capacity which have a CAPEX equivalent to V2G
    BESS_power = input_parameters{4}; % BESS_capacity*(7/60); % 7 kW of power per 60 kWh of storage 
    BESS_SOC = 50; % initial SOC in %
    BESS_discharge_limit = input_parameters{34}; % 10;
    BESS_charge_limit = input_parameters{35}; % 90;
    BESS_cumulative_charge = 0;
    BESS_cumulative_discharge = 0;

    
    
    load_profile_data = readmatrix(input_files_paths{1}); % readmatrix('input_data/weekday_avg_winter_load.csv'); % normalized profile
    % if winter remove 4th and 5th columns from the load profiles matrix
    % if summer remove the 2nd and 3rd colums from the load profiles matrix
    if month_of_the_year == 1
        load_profile_data(:,[4 5])=[];
        peak_load = input_parameters{5}; % 4.7E+6; % kW, (peak at around 4.5 GW for Jordan) defined for a full year

        'winter season'
    elseif month_of_the_year == 7
        load_profile_data(:,[2 3])=[];
        peak_load = input_parameters{42};

        'summer season'
    end
    
    
    % Monthly_variation_index_2016 = readmatrix(input_files_paths{3}); % readmatrix('input_data/Monthly_variation_index_2016.csv');
    
    load_profile_data_weekday(:,1) = load_profile_data(:,1);
    load_profile_data_weekend(:,1) = load_profile_data(:,1);

    load_profile_data_weekday(:,2) = load_profile_data(:,2); % *Monthly_variation_index_2016(month_of_the_year); % normalized profile
    load_profile_data_weekend(:,2) = load_profile_data(:,3); % *Monthly_variation_index_2016(month_of_the_year); % normalized profile

    load_scaling_factor = peak_load/max(load_profile_data_weekday(:,2));
    
    commercialpluggedprobability = readmatrix(input_files_paths{4}); % readmatrix('input_data/commercialpluggedprobability.csv');
    employeepluggedprobability = readmatrix(input_files_paths{5}); % readmatrix('input_data/employeepluggedprobability.csv');
    homepluggedprobability = readmatrix(input_files_paths{6}); % readmatrix('input_data/homepluggedprobability.csv');


    f = 8; % use a resolution multiplier of 8 for hourly profile
    if (month_of_the_year >= 4) && (month_of_the_year <= 9)
        season_weektime = 1; % 1: summer weekday, 2: summer weekend, 3: winter weekday, 4: winter weekend
    else
        season_weektime = 3; % 1: summer weekday, 2: summer weekend, 3: winter weekday, 4: winter weekend
    end
    % must supply hourly data (25x4 points)
    commercialPB_preinterpolated_weekday = preinterpolate_pluggedin_prob(commercialpluggedprobability(:,season_weektime),f);
    homePB_preinterpolated_weekday = preinterpolate_pluggedin_prob(homepluggedprobability(:,season_weektime),f);
    employeePB_preinterpolated_weekday = preinterpolate_pluggedin_prob(employeepluggedprobability(:,season_weektime),f);
    
    if (month_of_the_year >= 4) && (month_of_the_year <= 9)
        season_weektime = 2; % 1: summer weekday, 2: summer weekend, 3: winter weekday, 4: winter weekend
    else
        season_weektime = 4; % 1: summer weekday, 2: summer weekend, 3: winter weekday, 4: winter weekend
    end
    %season_weektime = 4; % 1: summer weekday, 2: summer weekend, 3: winter weekday, 4: winter weekend
    % must supply hourly data (25x4 points)
    commercialPB_preinterpolated_weekend = preinterpolate_pluggedin_prob(commercialpluggedprobability(:,season_weektime),f);
    homePB_preinterpolated_weekend = preinterpolate_pluggedin_prob(homepluggedprobability(:,season_weektime),f);
    employeePB_preinterpolated_weekend = preinterpolate_pluggedin_prob(employeepluggedprobability(:,season_weektime),f);
    
    
    %% generate a matrix of cars information
    
    clear battery_size car_type cars
    
    
    random_shift = randi(30,number_of_EVs,1); % shift ranging from 1 minute to 30 minutes
    % Column 1: car type
    %   1: home, 2: commercial, 3: employee
    % Column 2: car battery size
    %   40 kWh, 60 kWh, 80 kWh
    % Column 3: initial SOC
    % Column 4: initial plug status
    % Column 5: distance travelled
    % Column 6: cummulative energy consumed
    % Column 7: cummulative energy discharged
    % Column 8: remaining allowed V2G unsubscriptions
    % Column 9: number of minutes the EV is available for V2G (plugged and SOC within window)
    % Column 10: number of minutes the EV is discharging (for capacity factor calculation) 
    % Column 11: energy effeciency (kWh/km)
    
    energy_effeciency = readmatrix(input_files_paths{7}); % readmatrix('input_data/energy_effeciency.csv'); % normalized profile
    
    % Maybe add energy effeciency column in kWh/km
    cars = zeros(number_of_EVs,11);

    car_type_options = [1, 2, 3];
    car_type_weights = [input_parameters{44}/100,input_parameters{45}/100,input_parameters{46}/100];
    car_type_array = randsample(car_type_options, number_of_EVs, true, car_type_weights);

    for i = 1:number_of_EVs
        car_type = car_type_array(i);
        if car_type == 2
            battery_size = 20 * randi([3 4],1,1) * clustering_factor;
        else
            battery_size = 20 * randi([2 4],1,1) * clustering_factor;
        end
        if season_weektime < 3 
            % summer
            EV_effeciency = energy_effeciency((battery_size/20/clustering_factor - 1),2);
        else
            % winter
            EV_effeciency = energy_effeciency((battery_size/20/clustering_factor - 1),1);
        end
        cars(i,:) = [car_type, battery_size, randi([50 90],1,1), false, 0, 0, 0, allowed_unsubscriptions, 0, 0, EV_effeciency]; % randi([50 90],1,1); columns 5,6 and 7 are dedicated for logging distance travelled, energy charged and discharged
    end
    
    %% Simulate random fluctuations of plugged status and distances travelled based on a pdf (30 minutes intervals)
    tic
    clear f_home_plugged f_commercial_plugged f_employee_plugged
    clear time avg_distance plugged_cdf
    clear cars_plugged_status plugged_prob cars_distance_travelled cars_subscribed_status
    clear alpha_distance beta_distance B_distance Si PDF_distance CDF_distance random_distance
    
    
    % Average distance travelled by a car during 30 minutes depends on
    % the traffic density, and the route followed.
    
    min_distance = input_parameters{36} * clustering_factor; % km/hr
    max_distance = input_parameters{41} * clustering_factor; % km/hr
    % https://en.wikipedia.org/wiki/Beta_distribution
    alpha_distance = input_parameters{37}; % 10;
    beta_distance = input_parameters{38}; % 10;
  
    cars_plugged_status = zeros(number_of_EVs,number_of_days*24*2 + 1);
    cars_distance_travelled = zeros(number_of_EVs,number_of_days*24*2 + 1);
    cars_subscribed_status = ones(number_of_EVs,number_of_days*24*2 + 1);
    
    if number_of_cycles == 0
        if ~isempty(progressFcn)
            progressFcn(0, sprintf('Simulating plug-in and subscription histories ...'));
        end
    else
        if ~isempty(progressFcn)
            progressFcn(0, sprintf('Cycle %d of %d (season %d): simulating plug-in and subscription histories ... ', outerloop, number_of_cycles, season));
        end
    end

    for i = 1:number_of_EVs
        
        if mod(i,1000) == 0
            if number_of_cycles == 0
                if ~isempty(progressFcn)
                    progressFcn(i/number_of_EVs, sprintf('Simulating plug-in and subscription histories ...'));
                end
            else
                if ~isempty(progressFcn)
                    progressFcn(i/number_of_EVs, sprintf('Cycle %d of %d (season %d): simulating plug-in and subscription histories ... ', outerloop, number_of_cycles, season));
                end
            end
        end

        for j = 1:(number_of_days*24*2+1)  %30 minutes intervals
            
            if mod(j/(24*2),7) < 6
                weekday_flag = true;
                weekend_flag = false;
            else
                weekday_flag = false;
                weekend_flag = true;
            end
            
            time = mod(j/2,24); % hour of the day
            % check type of car to assign mean probability
            switch cars(i,1) 
                case 1        
                    
                    x_target = time;   % Target value to search for in the first column
                    if weekday_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(homePB_preinterpolated_weekday(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = homePB_preinterpolated_weekday(idx, 2);
                    elseif weekend_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(homePB_preinterpolated_weekend(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = homePB_preinterpolated_weekend(idx, 2);
                    end
                case 2
    
                    x_target = time;   % Target value to search for in the first column
                    % Find index of the closest value in the first column
                    if weekday_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(commercialPB_preinterpolated_weekday(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = commercialPB_preinterpolated_weekday(idx, 2);
                    elseif weekend_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(commercialPB_preinterpolated_weekend(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = commercialPB_preinterpolated_weekend(idx, 2);
                    end
    
                case 3
    
                    x_target = time;   % Target value to search for in the first column
                    if weekday_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(employeePB_preinterpolated_weekday(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = employeePB_preinterpolated_weekday(idx, 2);
                    elseif weekend_flag == true
                        % Find index of the closest value in the first column
                        [~, idx] = min(abs(employeePB_preinterpolated_weekend(:,1) - x_target));
                        % Retrieve the corresponding value in the second column
                        plugged_prob = employeePB_preinterpolated_weekend(idx, 2);
                    end
            end
    
            
            % "1" means the car is plugged
            if rand() <= plugged_prob
                cars_plugged_status(i,j) = 1;
                % user may decide to unsubscribe anytime while plugged
                % the decision to unsubscribe will isolate the EV from V2G for 24 hours            
                if cars_subscribed_status(i,j) == 1
                    if rand() <= cars(i,8)/((30-mod((j/48),30))*24*2)
                        % decision to unsubscribe
                        if  (j+47) <= (number_of_days*24*2)
                            cars_subscribed_status(i,j:j+47) = 0;
                        else
                            cars_subscribed_status(i,j:end) = 0;
                        end
                        
                        cars(i,8) = cars(i,8) - 1;
                    end
                end
            else
                cars_plugged_status(i,j) = 0;
                % look into CDF to see which index the rand val corresponds to
                % multiplying by a factor of "2" and avg_distance in order to shift the mean
                % to avg_distance (some trips can be up to 2 x  avg. distance)
                
                temp_rand = betarnd(alpha_distance, beta_distance, 1, 1);
                random_distance = 0.5 *(min_distance + temp_rand * (max_distance-min_distance)); % multiplied by 0.5 because sampling for 30 minutes

                cars_distance_travelled(i,j) = random_distance;
            end
    
        end
    end
    
    toc
    
    %% interpolate solar generation, wind generation load data
    
    if ~isempty(progressFcn)
        progressFcn(0, sprintf('Simulating load, solar and wind profiles ...'));
    end
    
    temp_solar_data = readmatrix(input_files_paths{8}); % readmatrix('input_data/solar_generation.csv');
    solar_generation_time_scale = temp_solar_data(1,:);
    solar_generation = temp_solar_data(2:13,:);
    temp_wind_data = readmatrix(input_files_paths{9}); % readmatrix('input_data/wind_generation.csv');
    wind_generation_time_scale = temp_wind_data(1,:);
    wind_generation = temp_wind_data(2:13,:);
    
    clear temp_solar_data temp_wind_data

    for i=1:12 % 12 solar generation profiles (12 months)
        f_solar_generation{i} = @(z) interp1(solar_generation_time_scale(1,:),solar_generation(i,:),z); % kW/MWp
    end
    
    for i=1:12 % 12 wind generation profiles (12 months)
        f_wind_generation{i} = @(z) interp1(wind_generation_time_scale(1,:),wind_generation(i,:),z); % kW/MWp
    end
    
    f_load_profile_weekday = @(z) interp1(load_profile_data_weekday(:,1),load_profile_data_weekday(:,2),z);
    f_load_profile_weekend = @(z) interp1(load_profile_data_weekend(:,1),load_profile_data_weekend(:,2),z);
    
    
    %% Simulate random fluctuations of solar energy and hourly load based on a autoregressive variability
    
    clear alpha beta B_solar PDF_solar CDF_solar N_samples rand_vals solar_random_sample

    % generate random values
    
    N_samples = number_of_days*24*2*3 + 1;  % one random value for each 10 minutes
    AR_models_parameters = readmatrix(input_files_paths{2});
    if month_of_the_year == 1
        
        AR_models_parameters(:,4:6) = []; % readmatrix("input_data/AR_models_parameters.csv");
        'winter season'
    elseif month_of_the_year == 7
        
        AR_models_parameters(:,1:3) = []; % readmatrix("input_data/AR_models_parameters.csv");
        'summer season'
    end

    

    load_random_sample = correlated_random_array(N_samples, AR_models_parameters(1,1), AR_models_parameters(2,1),1-AR_models_parameters(3,1),1+AR_models_parameters(3,1)); % correlated_random_array(N_samples, 0.95, 0.1,0.9,1.1);
    solar_random_sample = correlated_random_array(N_samples, AR_models_parameters(1,2), AR_models_parameters(2,2),1-AR_models_parameters(3,2),1+AR_models_parameters(3,2)); % correlated_random_array(N_samples, 0.95, 0.2,0.5,1.5); % AR(1) process
    wind_random_sample = correlated_random_array(N_samples, AR_models_parameters(1,3), AR_models_parameters(2,3),1-AR_models_parameters(3,3),1+AR_models_parameters(3,3)); % correlated_random_array(N_samples, 0.95, 0.2,0.5,1.5); % AR(1) process
    
    %% mismatch driven charge-discharge time series calculation
    
    clear a b load_profile c k avg_soc avg_soc_BESS no_charge_counter delay_charge_counter delay_discharge_counter
    
    a = zeros(number_of_days,24 * 60); % solar generation
    b = zeros(number_of_days,24 * 60); % wind generation
    c = zeros(number_of_days,24 * 60); % total EV charging rate
    d = zeros(number_of_days,24 * 60); % BESS charging rate
    avg_soc = zeros(number_of_days,24 * 60);
    avg_soc_BESS = zeros(number_of_days,24 * 60);
    load_profile = zeros(number_of_days,24 * 60); % load excluding EV charging
    BESS_discharge_time = 0;
    
    solar_generation_nan_counter = 0;
    wind_generation_nan_counter = 0;
    no_RE_counter = 0;
    no_charge_counter = 0;
    charge_sufficient_counter = 0;
    delay_charge_counter = 0;
    delay_discharge_counter = 0;
    weekday_counter = 0;
    
    daily_variation_factors_data = readmatrix(input_files_paths{10}); % readmatrix('input_data/daily_variation_factors.csv');
    DVF_load = daily_variation_factors_data(:,1); % readmatrix('input_data/DVF_load.csv');
    DVF_solar = daily_variation_factors_data(:,2); % readmatrix('input_data/DVF_solar.csv');
    DVF_wind = daily_variation_factors_data(:,3); % readmatrix('input_data/DVF_wind.csv');
        
    daily_variation_factors_data

    for i=1:number_of_days % number_of_simulated_days
        
        if number_of_cycles == 0
            if ~isempty(progressFcn)
                progressFcn(i/number_of_days, sprintf('Simulating V2G integration day %d of %d ...', i, number_of_days));
            end
        else
            if ~isempty(progressFcn)
                progressFcn(i/number_of_days, sprintf('Cycle %d of %d (season %d): simulating V2G integration day %d of %d ...', outerloop, number_of_cycles, season, i, number_of_days));
            end
        end

        tic
        weekday_counter = weekday_counter + 1;
        if weekday_counter > 5
            weekend_flag = true;
            weekday_flag = false;
            if weekday_counter == 7
                % reset weekday counter
                weekday_counter = 0;
            end
        else
            weekend_flag = false;
            weekday_flag = true;
        end
    
    
        for j = 1:(24 * 60) % minute by minute
            
            % % The following statement can be used to stop simulation mid-day
            % if (i == number_of_days) && (j == 12*60)
            %     'return'
            %     return
            %
            % end
    
    
            % all loads and generation rates are in kW
            
            % with fluctuation of solar energy generated every 10 minutes
            a(i,j) = DVF_solar(i)*solar_random_sample((i-1)*24*6 + ceil(j/10))*installed_solar_capacity*f_solar_generation{month_of_the_year}(j/60);
            
            % !! add fluctuation of wind energy
            b(i,j) = DVF_wind(i)*wind_random_sample((i-1)*24*6 + ceil(j/10))*installed_wind_capacity*f_wind_generation{month_of_the_year}(j/60);
            if isnan(a(i,j))
                % 'solar generation nan'
                solar_generation_nan_counter = solar_generation_nan_counter + 1;
                a(i,j) = 0;
            end
            if isnan(b(i,j))
                % 'wind generation nan'
                wind_generation_nan_counter = wind_generation_nan_counter + 1;
                b(i,j) = 0;
            end
            
            % non-EV load (estimate the hour of the day through 'j/60')
            if weekday_flag == true 
                load_profile(i,j) = DVF_load(i)*load_random_sample((i-1)*24*6 + ceil(j/10))*load_scaling_factor*f_load_profile_weekday(j/60); % kW 
            elseif weekend_flag == true
                load_profile(i,j) = DVF_load(i)*load_random_sample((i-1)*24*6 + ceil(j/10))*load_scaling_factor*f_load_profile_weekend(j/60); % kW 
            end
    
            mean_SOC = mean(cars(cars(:,3)<=85,3));
    
            net_load = load_profile(i,j) + c(i,j) - (a(i,j)+b(i,j));
            % BESS response simulation
            % ------------------------
            if BESS_capacity > 0
                if net_load > (1+baseline_buffer)*netload_baseline
                    if (BESS_SOC > BESS_discharge_limit) % BESS_discharge_limit = 10%
                        % discharge
                        if (net_load - ((1+baseline_buffer)*netload_baseline)) < BESS_power
                            d(i,j) = -(net_load - ((1+baseline_buffer)*netload_baseline));  % kW 
                            BESS_SOC = BESS_SOC + 100*(d(i,j)*(1/60))/(discharging_eff*BESS_capacity); % SOC percentage
                            BESS_cumulative_discharge = BESS_cumulative_discharge - d(i,j)*(1/60); % kWh
                            BESS_discharge_time = BESS_discharge_time + 1;
                        else
                            d(i,j) = -(BESS_power);
                            BESS_SOC = BESS_SOC + 100*(d(i,j)*(1/60))/(discharging_eff*BESS_capacity); % SOC percentage
                            BESS_cumulative_discharge = BESS_cumulative_discharge - d(i,j)*(1/60); % kWh
                            BESS_discharge_time = BESS_discharge_time + 1;
                        end
                    else
                        % do nothing
                        d(i,j) = 0;
                    end
                elseif net_load < (1-baseline_buffer)*netload_baseline
                    if (BESS_SOC < BESS_charge_limit) % BESS_discharge_limit = 0.9
                        % charge
                        if (((1-baseline_buffer)*netload_baseline) - net_load) < BESS_power                   
                            d(i,j) = ((1-baseline_buffer)*netload_baseline) - net_load;
                            BESS_SOC = BESS_SOC + 100*(charging_eff*d(i,j)*(1/60))/(BESS_capacity); % SOC percentage
                            BESS_cumulative_charge = BESS_cumulative_charge + d(i,j)*(1/60); % kWh
                        else
                            d(i,j) = (BESS_power);
                            BESS_SOC = BESS_SOC + 100*(charging_eff*d(i,j)*(1/60))/(BESS_capacity); % SOC percentage
                            BESS_cumulative_charge = BESS_cumulative_charge + d(i,j)*(1/60); % kWh
                        end
                    else
                        % do nothing
                        d(i,j) = 0;
                    end
                end
            end
            % ------------------------
    
    
            % loop randomly over cars for random assignment of charging roles
            for k=randperm(number_of_EVs,number_of_EVs)
                net_load = load_profile(i,j) + c(i,j) + d(i,j) - (a(i,j)+b(i,j));
                if cars_plugged_status(k,(i-1)*24*2 + ceil((j+random_shift(k))/30)) == 1
                    % car plugged
                    % add conditions for charging/discharging
                    % based on load and renewable energy generated
                   
                    if (cars(k,3) <= discharge_limit) || ((cars_subscribed_status(k,(i-1)*24*2 + ceil(j/30)) == 0) && (cars(k,3) < 100)) % no discharging, charge anyway
                        % charge
    
                        % update total EV charging rate (negative would be discharging)
                        c(i,j) = c(i,j) + charging_rate; % 7 kW charging rate
                        % update car SOC for 1 minute charging
                        cars(k,3) = cars(k,3) + 100*charging_eff*charging_rate*(1/60)/(cars(k,2));
                        cars(k,6) = cars(k,6) + charging_rate*(1/60);
    
                    elseif cars(k,3) >= charge_limit % no charging, discharge if needed
                        
                        if (net_load) > netload_baseline
                            % discharge
                            
                            c(i,j) = c(i,j) - discharging_rate; % update total EV charging rate (negative indicates discharging)
                            % update car SOC for 10 minutes discharging
                            cars(k,3) = cars(k,3) - 100*discharging_rate*(1/60)/(discharging_eff*cars(k,2));
                            cars(k,7) = cars(k,7) + discharging_rate*(1/60);
    
                            cars(k,10) = cars(k,10) + 1; % tally 1 minute discharging
    
                        end
    
                    elseif (cars(k,3) > discharge_limit) && (cars(k,3) < charge_limit) % charge or discharge based on grid status
                         
                         % check if the mismatch (load + V2G - renewables) is larger or
                         % smaller than grid baseline generation
    
                        if (net_load) > netload_baseline
                            % Check if the NLV is within the priority charging window 
                            
                            if (net_load) > (1+baseline_buffer+DDW)*netload_baseline
                                % discharge
                                
                                c(i,j) = c(i,j) - discharging_rate; % update total EV charging rate (negative would be discharging)
                                % update car SOC for 10 minutes discharging
                                cars(k,3) = cars(k,3) - 100*discharging_rate*(1/60)/(discharging_eff*cars(k,2));
                                cars(k,7) = cars(k,7) + discharging_rate*(1/60);
                                
                                cars(k,9) = cars(k,9) + 1; % tally 1 minute as V2G storage
                                cars(k,10) = cars(k,10) + 1; % tally 1 minute discharging
    
                            elseif (net_load) > (1+baseline_buffer)*netload_baseline
    
                                % discharge only if SOC is larger than 90% of the mean SOC
                                if (cars(k,3) >= 0.95*mean_SOC) % && (delayed_discharge == true)
                                    % discharge
                                    c(i,j) = c(i,j) - discharging_rate; % update total EV charging rate (negative would be discharging)
                                    % update car SOC for 10 minutes discharging
                                    cars(k,3) = cars(k,3) - 100*discharging_rate*(1/60)/(discharging_eff*cars(k,2));
                                    cars(k,7) = cars(k,7) + discharging_rate*(1/60);
    
                                    cars(k,9) = cars(k,9) + 1; % tally 1 minute as V2G storage
                                    cars(k,10) = cars(k,10) + 1; % tally 1 minute discharging
    
                                else
                                    delay_discharge_counter = delay_discharge_counter + 1;
                                    % do nothing
                                    % discharge delayed because SOC is below 90% of average SOC 
                                end
                            
                            else
                                % in buffer region, do not discharge regardless of SOC
    
                            end
    
                        elseif ((net_load) < netload_baseline) % charge only if renewable energy is available: && (((c(i,j) + charging_rate) < (a(i,j) + b(i,j)) || limitEVCharging_to_renewables == false)) % 
                            % Check if the NLV is within the priority charging window
                            
                            if (net_load) < (1-baseline_buffer-PCW)*netload_baseline
                                % charge
        
                                c(i,j) = c(i,j) + charging_rate; % update total EV charging rate (negative would be discharging)
                                % update car SOC for 10 minutes charging
                                cars(k,3) = cars(k,3) + 100*charging_eff*charging_rate*(1/60)/(cars(k,2));
                                cars(k,6) = cars(k,6) + charging_rate*(1/60);
    
                                cars(k,9) = cars(k,9) + 1; % tally 1 minute as V2G storage
                            elseif (net_load) < (1-baseline_buffer)*netload_baseline
                                % charge only if SOC is smaller than 105% of the mean SOC
                                if (cars(k,3) <= 1.05*mean_SOC) % && (priority_charge == true)
                                    % charge
        
                                    c(i,j) = c(i,j) + charging_rate; % update total EV charging rate (negative would be discharging)
                                    % update car SOC for 10 minutes charging
                                    cars(k,3) = cars(k,3) + 100*charging_eff*charging_rate*(1/60)/(cars(k,2));
                                    cars(k,6) = cars(k,6) + charging_rate*(1/60);
    
                                    cars(k,9) = cars(k,9) + 1; % tally 1 minute as V2G storage
                                else
                                    delay_charge_counter = delay_charge_counter + 1;
                                    % do nothing
                                    % charge delayed because SOC is above 110% of average SOC 
                                end
                            else
                                % in buffer region, do not charge regardless of SOC
                            end
    
                        elseif ((net_load) < netload_baseline) && (((c(i,j) + charging_rate) > (a(i,j) + b(i,j)) && limitEVCharging_to_renewables == True)) % charge only if renewable energy is available
                            % neither charge nor discharge (unless charging EV
                            % is not limieted to renewables)
                            
                            no_RE_counter = no_RE_counter + 1;
                            
                            % c(i,j) = c(i,j) + charging_rate; % update total EV charging rate (negative would be discharging)
                            % % update car SOC for 10 minutes charging
                            % cars(k,3) = cars(k,3) + 100*charging_rate*(1/60)/cars(k,2);
    
                        end
    
                    end
    
                else % car is unplugged, need to update the SOC based on travelled distance
                    if cars(k,3) > min_charge
                        
                        charge_sufficient_counter = charge_sufficient_counter + 1;

                        cars(k,3) = cars(k,3) - 100*cars(k,11)*(1/30)*cars_distance_travelled(k,(i-1)*24*2 + ceil(j/30))/cars(k,2); % 0.188 kWh/km, 10 minutes
                        cars(k,5) =  cars(k,5) + (1/30)*cars_distance_travelled(k,(i-1)*24*2 + ceil(j/30)); % distance travelled over 1 minute

                    else
                        % 'not enough charge'
                        % 'no charge for the planned trip'
                        no_charge_counter = no_charge_counter + 1;

                        % charge car as if the plugged status was equal to 1
                        % update total EV charging rate (negative would be discharging)
                        c(i,j) = c(i,j) + charging_rate; % 7 kW charging rate
                        % update car SOC for 1 minute charging
                        cars(k,3) = cars(k,3) + 100*charging_eff*charging_rate*(1/60)/(cars(k,2));
                        cars(k,6) = cars(k,6) + charging_rate*(1/60);
                        
                    end
                end

                % if isnan(cars(k,3))
                %     cars(k,3)
                % end
                    
            end
            
            avg_soc(i,j) = mean(cars(:,3));
            avg_soc_BESS(i,j) = BESS_SOC;
    
        end
        toc
    end
    
    
    mismatch = load_profile - (a + b);
    
    %%
    
    % Plotting NLV and NLV_V2G histograms
    NLV = load_profile - (a + b) - netload_baseline;
    NLV_V2G = load_profile + c - (a + b) - netload_baseline;
    NLV_BESS = load_profile + d - (a + b) - netload_baseline;
    NLV_V2G_BESS = load_profile + c + d - (a + b) - netload_baseline;
    
    
    %% NL metrics
    
    % w/o V2G
    NL_metrics(1) = max(mean(mismatch)); % max nominal NL (CCGT)
    NL_metrics(2) = mean(mean(mismatch)); % mean of nominal NL
    NL_metrics(3) = mean(mean(mismatch))/max(mean(mismatch)); % load following CF
    NL_metrics(4) = max(max(mismatch))-max(mean(mismatch)); % peaking capacity (SCGT)
    
    % w V2G and BESS (combined)
    NL_V2G_BESS_metrics(1) = max(mean(mismatch+c+d));
    NL_V2G_BESS_metrics(2) = mean(mean(mismatch+c+d));
    NL_V2G_BESS_metrics(3) = mean(mean(mismatch+c+d))/max(mean(mismatch+c+d));
    NL_V2G_BESS_metrics(4) = max(max(mismatch+c+d))-max(mean(mismatch+c+d));
    
    
    % --------------------------------------------------
    % --------------------------------------------------
    
    for i=1:number_of_days
        for j=1:60*24    
            if mismatch(i,j) > NL_metrics(1)
                mismtach_peaking(i,j) = mismatch(i,j) - NL_metrics(1);
            else
                mismtach_peaking(i,j) = 0;
            end
        end
    end
    
    peaking_CF = mean(mean(mismtach_peaking))/max(max(mismtach_peaking));
    
    
    for i=1:number_of_days
        for j=1:60*24    
            if (mismatch(i,j) + c(i,j)) > NL_V2G_BESS_metrics(1)
                mismtach_peaking_V2G_BESS(i,j) = mismatch(i,j) + c(i,j) - NL_V2G_BESS_metrics(1);
            else
                mismtach_peaking_V2G_BESS(i,j) = 0;
            end
        end
    end
    
    peaking_CF_V2G_BESS = mean(mean(mismtach_peaking_V2G_BESS))/max(max(mismtach_peaking_V2G_BESS));
    
    % --------------------------------------------------
    % --------------------------------------------------
    
    curtailment = 0;
    for i=1:number_of_days
        for j=1:60*24    
            if mismatch(i,j) < CCGT_min_load*NL_metrics(1)
                curtailment = curtailment + (1/60)*(CCGT_min_load*NL_metrics(1) - mismatch(i,j)); % kWh
            end
        end
    end
    
    curtailment_ratio = curtailment/(sum(sum(a))/60);
    
    curtailment_V2G_BESS = 0;
    for i=1:number_of_days
        for j=1:60*24    
            if (mismatch(i,j) + c(i,j)) < CCGT_min_load*NL_V2G_BESS_metrics(1)
                curtailment_V2G_BESS = curtailment_V2G_BESS + (1/60)*(CCGT_min_load*NL_V2G_BESS_metrics(1) - (mismatch(i,j)+ c(i,j))); % kWh
            end
        end
    end
    
    curtailment_ratio_V2G_BESS = curtailment_V2G_BESS/(sum(sum(a))/60);
    
    
    % --------------------------------------------------
    % --------------------------------------------------
    
    effective_capacity = sum(cars(:,2).*cars(:,9)/(number_of_days*24*60)); % based on fraction of time the EV is available to charge or discharge
    effective_capacity_availability = effective_capacity/sum(cars(:,2));
    capacity_factor = sum(cars(:,2).*cars(:,10)/(number_of_days*24*60))/sum(cars(:,2)) % based on fraction of time the EV is available to discharge
    capacity_factor_BESS = BESS_discharge_time/(number_of_days*24*60)
    
    if number_of_EVs > 0
        AE = (365/number_of_days)*mean(cars(:,7)); % average annual energy discharged per EV
    else
        AE = 0;
    end
    LCOS = (FCR*CAPEX_V2G + yearly_degradation_rate*CAPEX_V2G)/AE + LCOE*(1/(charging_eff*discharging_eff)+kWh_compensation)
    
    AE_BESS = (365/number_of_days)*BESS_cumulative_discharge;
    LCOS_BESS = (FCR*CAPEX_BESS*BESS_capacity + yearly_degradation_rate*CAPEX_BESS*BESS_capacity)/AE_BESS + LCOE*(1/(charging_eff*discharging_eff))
        
    PP_discount_rate_factor = 0;
    for NPV_year=1:PP_life_span
        PP_discount_rate_factor = PP_discount_rate_factor + 1/((1+discount_rate)^NPV_year);
    end

    V2G_discount_rate_factor = 0;
    for NPV_year=1:V2G_life_span
        V2G_discount_rate_factor = V2G_discount_rate_factor + 1/((1+discount_rate)^NPV_year);
    end

    % equivalent annual annuity (EAA) scaled over 6 months (for each season)
    % ---------------
    EAA_peak_V2G_BESS = 0.5*(peaking_CF*NL_metrics(4) - peaking_CF_V2G_BESS*NL_V2G_BESS_metrics(4))*(365*24)*Peaking_premium;
    EAA_curtailment_V2G_BESS = 0.5*(curtailment - curtailment_V2G_BESS)*(365/number_of_days)*LCOE;
    EAA_RTE_V2G = 0.5*number_of_EVs*(AE)*LCOE*(1/(charging_eff*discharging_eff)-1+kWh_compensation);
    EAA_ONM_V2G = 0.5*(yearly_degradation_rate + charger_replacement_rate)*number_of_EVs*CAPEX_V2G;
        
    EAA_RTE_BESS = 0.5*(365/number_of_days)*BESS_cumulative_discharge*LCOE*(1/(charging_eff*discharging_eff)-1);
    EAA_ONM_BESS = 0.5*BESS_capacity*(BESS_ONM + BESS_yearly_degradation_rate*CAPEX_BESS);
    
    % multiplied by 0.5 as it will be calculated twice in the winter and summer simulation
    EAA_EV_CAPEX = 0.5*CAPEX_V2G*number_of_EVs/(V2G_discount_rate_factor);
    EAA_CAPEX_BESS = 0.5*CAPEX_BESS*BESS_capacity/(V2G_discount_rate_factor);

    % CCGT and SCGT CAPEX and O&M EAA can be evaluated accurately only after simulating two seasons
    % The lines below provide values for seasonal calculations only
    % In the mean EAA reporting, the values below are overriden based on 2-season results
    
    if NL_metrics(1) < existing_CCGT
        CCGT_wo_storage = existing_CCGT;
    else
        CCGT_wo_storage = NL_metrics(1);
    end
    
    if NL_V2G_BESS_metrics(1) < existing_CCGT
        CCGT_w_storage = existing_CCGT;
    else
        CCGT_w_storage = NL_V2G_BESS_metrics(1);
    end

    EAA_CCGT_CAPEX_V2G = 0.5*CCGT_CAPEX*((CCGT_wo_storage-CCGT_w_storage))/PP_discount_rate_factor; % 0;


    if NL_metrics(4) < existing_SCGT
        SCGT_wo_storage = existing_SCGT;
    else
        SCGT_wo_storage = NL_metrics(4);
    end
    
    if NL_V2G_BESS_metrics(4) < existing_SCGT
        SCGT_w_storage = existing_SCGT;
    else
        SCGT_w_storage = NL_V2G_BESS_metrics(4);
    end

    EAA_SCGT_CAPEX_V2G = 0.5*SCGT_CAPEX*(SCGT_wo_storage-SCGT_w_storage)/PP_discount_rate_factor;
    
    EAA_ONM_CCGT = 0.5*CCGT_ONM*((NL_metrics(1)-NL_V2G_BESS_metrics(1)));
    EAA_ONM_SCGT = 0.5*SCGT_ONM*(NL_metrics(4)-NL_V2G_BESS_metrics(4));

    EAA_components = [EAA_CCGT_CAPEX_V2G, EAA_SCGT_CAPEX_V2G, -1*EAA_EV_CAPEX, EAA_peak_V2G_BESS, EAA_curtailment_V2G_BESS, -1*EAA_RTE_V2G, -1*EAA_ONM_V2G, EAA_ONM_CCGT, EAA_ONM_SCGT, -1*EAA_CAPEX_BESS, -1*EAA_RTE_BESS, -1*EAA_ONM_BESS];
    
    % Storage (V2G and BESS combined) NPV calculation
    % ---------------
    
    NPV_peak_V2G_BESS = (peaking_CF*NL_metrics(4) - peaking_CF_V2G_BESS*NL_V2G_BESS_metrics(4))*8760*Peaking_premium;
    NPV_curtailment_V2G_BESS = (curtailment - curtailment_V2G_BESS)*(365/number_of_days)*LCOE;
    NPV_RTE_V2G = number_of_EVs*AE*LCOE*(1/(charging_eff*discharging_eff)-1+kWh_compensation);
    NPV_ONM_V2G = (yearly_degradation_rate + charger_replacement_rate)*number_of_EVs*CAPEX_V2G;
    
    NPV_ONM_CCGT = CCGT_ONM*(NL_metrics(1)-NL_V2G_BESS_metrics(1));
    NPV_ONM_SCGT = SCGT_ONM*(NL_metrics(4)-NL_V2G_BESS_metrics(4));
    
    NPV_RTE_BESS = (365/number_of_days)*BESS_cumulative_discharge*LCOE*(1/(charging_eff*discharging_eff)-1);
    NPV_ONM_BESS = BESS_capacity*BESS_yearly_degradation_rate*CAPEX_BESS;


    NPV_CCGT_CAPEX_V2G = CCGT_CAPEX*((NL_metrics(1)-NL_V2G_BESS_metrics(1)));
    NPV_SCGT_CAPEX_V2G = SCGT_CAPEX*(NL_metrics(4)-NL_V2G_BESS_metrics(4));
    NPV_EV_CAPEX = CAPEX_V2G*number_of_EVs;
    
    NPV_CAPEX_BESS = CAPEX_BESS*BESS_capacity;

    NPV = 0; %NPV_CCGT_CAPEX_V2G + NPV_SCGT_CAPEX_V2G - NPV_EV_CAPEX - NPV_CAPEX_BESS + discount_rate_factor*(NPV_peak_V2G_BESS + NPV_curtailment_V2G_BESS - NPV_RTE_V2G - NPV_ONM_V2G - NPV_RTE_BESS - NPV_ONM_BESS + NPV_ONM_CCGT + NPV_ONM_SCGT) 
    
    NPV_components = 0; %[NPV_CCGT_CAPEX_V2G, NPV_SCGT_CAPEX_V2G, -1*NPV_EV_CAPEX, discount_rate_factor*NPV_peak_V2G_BESS, discount_rate_factor*NPV_curtailment_V2G_BESS, -1*discount_rate_factor*NPV_RTE_V2G, -1*discount_rate_factor*NPV_ONM_V2G, discount_rate_factor*NPV_ONM_CCGT, discount_rate_factor*NPV_ONM_SCGT, -1*NPV_CAPEX_BESS, -1*discount_rate_factor*NPV_RTE_BESS, -1*discount_rate_factor*NPV_ONM_BESS];
    
    % ---------------
    penetration = (mean(mean(a))+mean(mean(b)))/mean(mean(load_profile))
    
    % figure
    V2G_LCOS_data = (FCR*CAPEX_V2G + yearly_degradation_rate*CAPEX_V2G)./((365/number_of_days)*cars(:,7)) + LCOE*(1/(charging_eff*discharging_eff)+kWh_compensation);
        
    % figure
    V2G_yearly_consumption = 0.5*(365/number_of_days)*cars(:,6)/clustering_factor; % multiplied by 0.5 since the result is for a single season
    V2G_yearly_discharge = 0.5*(365/number_of_days)*cars(:,7)/clustering_factor; % multiplied by 0.5 since the result is for a single season
    
    % figure
    EV_total_discharge_cycles = 0.5*(365/number_of_days)*cars(:,6)./cars(:,2); % multiplied by 0.5 since the result is for a single season
    EV_V2G_discharge_cycles = 0.5*(365/number_of_days)*cars(:,7)./cars(:,2); % multiplied by 0.5 since the result is for a single season
    
    100*no_charge_counter/(no_charge_counter+charge_sufficient_counter)

    simulation_results_and_inputs = {mismatch, c, d, NLV, NLV_V2G, NLV_V2G_BESS, avg_soc, avg_soc_BESS, V2G_LCOS_data, V2G_yearly_consumption, ...
        V2G_yearly_discharge, EV_total_discharge_cycles, EV_V2G_discharge_cycles, cars(:,3), NPV_components, NL_metrics, NL_V2G_BESS_metrics, curtailment_ratio, curtailment_ratio_V2G_BESS, penetration, ...
        load_profile_data_weekday, load_profile_data_weekend, load_scaling_factor, load_profile, a, b, daily_variation_factors_data, commercialPB_preinterpolated_weekday, commercialPB_preinterpolated_weekend, homePB_preinterpolated_weekday, ...
        homePB_preinterpolated_weekend, employeePB_preinterpolated_weekday, employeePB_preinterpolated_weekend, energy_effeciency, EAA_components};
end


%%

function y = correlated_random_array(n, rho, sigma,a,b)
    % Generates an n-length array of values in [0,1] with autocorrelation
    % rho and innovation noise sigma using an AR(1) process
    
    x = zeros(1, n);                 % Preallocate
    x(1) = randn();                  % Initial value from standard normal

    for t = 2:n
        x(t) = rho * x(t-1) + sigma * randn();
    end

    % Transform via standard normal CDF to [0,1]
    z = normcdf(x);

    % Rescale to [a, b]
    y = a + (b - a) * z; % y is now in (a,b), shaped by the AR(1) process
end


function y = preinterpolate_pluggedin_prob(A,f)

    %A = commercialpluggedprobability;      % original array
    %f = 4;                % 8x resolution from hourly profile
    original_t = 0:24;%1:length(A(:,1));
    new_t = linspace(0, length(original_t)-1, (length(original_t) - 1) * f + 1);
    y = [new_t; interp1(original_t, A, new_t, 'linear')]';
    
    %clear A f original_t new_t

end