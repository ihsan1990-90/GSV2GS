function simulation_results_w_uncertainty_seasons = multi_cycle_func(input_parameters, input_files_paths, progressFcn, number_of_cycles)

for season=1:2 % 1 for winter, 2 for summer
    
    % set the selected month value (input_parameters{14}) to match the season (winter: 1, summer:7)
    if season == 1
        input_parameters{14} = 1; % Set month value for winter
    elseif season == 2
        input_parameters{14} = 7; % Set month value for summer
        input_parameters{8} = input_parameters{43};
    end
    
    for outerloop=1:number_of_cycles
        clear simulation_results
    
        simulation_results = simulation_main_func(input_parameters, input_files_paths, progressFcn, number_of_cycles, outerloop, season);
        
        cycle_EAA_components_seasonal(outerloop,:) = simulation_results{35}; % stores NPV components for one cycle
        cycle_NL_metrics{season}(outerloop,:) = simulation_results{16}; % stores NL metrics (CCGT, SCGT capacities, CF ...) for each cycle and each season
        cycle_NL_V2G_BESS_metrics{season}(outerloop,:) = simulation_results{17};

        cycle_EAA_seasonal(outerloop,1) = sum(simulation_results{35}); % NPV estimated over one cycle
        cycle_EAA_seasonal(outerloop,2) = mean(cycle_EAA_seasonal(1:end,1)); % mean NPV over all cycles
        cycle_EAA_seasonal(outerloop,3) = sqrt(var(cycle_EAA_seasonal(1:end,1))) % std of NPV over all cycles
        if outerloop > 5
            cycle_EAA_seasonal(outerloop,4) = 100*sqrt(var(cycle_EAA_seasonal((end-5):end,2)))/abs(cycle_EAA_seasonal(outerloop,2)); % convergence of mean NPV
            cycle_EAA_seasonal(outerloop,4)
        end

        cycle_EAA_components{season}(outerloop,:) = simulation_results{35}; 
        
        beep
    
    end
    cycle_EAA_summary_seasonal = cycle_EAA_seasonal(end,:);
    cycle_EAA_components_mean_seasonal = mean(cycle_EAA_components_seasonal,1);
    cycle_EAA_components_std_seasonal = sqrt(var(cycle_EAA_components_seasonal,1));
    
    PP_discount_rate_factor = 0;
    for NPV_year=1:input_parameters{30}
        PP_discount_rate_factor = PP_discount_rate_factor + 1/((1+input_parameters{29}/100)^NPV_year);
    end

    V2G_discount_rate_factor = 0;
    for NPV_year=1:input_parameters{47}
        V2G_discount_rate_factor = V2G_discount_rate_factor + 1/((1+input_parameters{29}/100)^NPV_year);
    end

    simulation_results_w_uncertainty = simulation_results;
    % Seasonal EAA results
    simulation_results_w_uncertainty{end+1} = cycle_EAA_components_mean_seasonal;
    simulation_results_w_uncertainty{end+1} = cycle_EAA_components_std_seasonal;
    simulation_results_w_uncertainty{end+1} = cycle_EAA_summary_seasonal;


    simulation_results_w_uncertainty_seasons{season} = simulation_results_w_uncertainty;

    if season == 2
        "CCGT avoided capacity summary"
        existing_CCGT = 1000*input_parameters{50}; % kW
        existing_SCGT = 1000*input_parameters{51}; % kW
        for i = 1:number_of_cycles
            % Correct estimated avoided CCGT capacity accounting for existing capacities
            % =================
            if cycle_NL_metrics{1}(i,1) < existing_CCGT % existing_CCGT
                CCGT_wo_storage_1 = existing_CCGT;
            else
                CCGT_wo_storage_1 = cycle_NL_metrics{1}(i,1);
            end
            
            if cycle_NL_V2G_BESS_metrics{1}(i,1) < existing_CCGT % existing_CCGT
                CCGT_w_storage_1 = existing_CCGT;
            else
                CCGT_w_storage_1 = cycle_NL_V2G_BESS_metrics{1}(i,1);
            end

            if cycle_NL_metrics{2}(i,1) < existing_CCGT % existing_CCGT
                CCGT_wo_storage_2 = existing_CCGT;
            else
                CCGT_wo_storage_2 = cycle_NL_metrics{2}(i,1);
            end
            
            if cycle_NL_V2G_BESS_metrics{2}(i,1) < existing_CCGT % existing_CCGT
                CCGT_w_storage_2 = existing_CCGT;
            else
                CCGT_w_storage_2 = cycle_NL_V2G_BESS_metrics{2}(i,1);
            end
            % =======================
            
            CCGT_avoided_storage(i) = max([CCGT_wo_storage_1, CCGT_wo_storage_2]) - max([CCGT_w_storage_1, CCGT_w_storage_2]);

            % Correct estimated avoided SCGT capacity accounting for existing capacities
            % =================
            if cycle_NL_metrics{1}(i,4) < existing_SCGT % existing_SCGT
                SCGT_wo_storage_1 = existing_SCGT;
            else
                SCGT_wo_storage_1 = cycle_NL_metrics{1}(i,4);
            end
            
            if cycle_NL_V2G_BESS_metrics{1}(i,4) < existing_SCGT % existing_SCGT
                SCGT_w_storage_1 = existing_SCGT;
            else
                SCGT_w_storage_1 = cycle_NL_V2G_BESS_metrics{1}(i,4);
            end

            if cycle_NL_metrics{2}(i,4) < existing_SCGT % existing_SCGT
                SCGT_wo_storage_2 = existing_SCGT;
            else
                SCGT_wo_storage_2 = cycle_NL_metrics{2}(i,4);
            end
            
            if cycle_NL_V2G_BESS_metrics{2}(i,4) < existing_SCGT % existing_SCGT
                SCGT_w_storage_2 = existing_SCGT;
            else
                SCGT_w_storage_2 = cycle_NL_V2G_BESS_metrics{2}(i,4);
            end

            
            SCGT_avoided_storage(i) = max([SCGT_wo_storage_1, SCGT_wo_storage_2]) - max([SCGT_w_storage_1, SCGT_w_storage_2]);
        end
        % CCGT_avoided_storage
        % SCGT_avoided_storage
        avoided_CCGT_mean = mean(CCGT_avoided_storage)
        avoided_CCGT_std = sqrt(var(CCGT_avoided_storage))

        avoided_SCGT_mean = mean(SCGT_avoided_storage)
        avoided_SCGT_std = sqrt(var(SCGT_avoided_storage))
        
        cycle_EAA_components_mean = mean(cycle_EAA_components{1}+cycle_EAA_components{2},1)
        cycle_EAA_components_std = sqrt(var(cycle_EAA_components{1}+cycle_EAA_components{2},1))
        
        % CCGT and SCGT avoided capacity EAA calculation

        cycle_EAA_components_mean(1) = avoided_CCGT_mean*input_parameters{25}/PP_discount_rate_factor
        cycle_EAA_components_mean(2) = avoided_SCGT_mean*input_parameters{26}/PP_discount_rate_factor
        cycle_EAA_components_mean(8) = avoided_CCGT_mean*input_parameters{31}
        cycle_EAA_components_mean(9) = avoided_SCGT_mean*input_parameters{32}

        cycle_EAA_components_std(1) = sqrt(var(CCGT_avoided_storage))*input_parameters{25}/PP_discount_rate_factor
        cycle_EAA_components_std(2) = sqrt(var(SCGT_avoided_storage))*input_parameters{26}/PP_discount_rate_factor
        cycle_EAA_components_std(8) = sqrt(var(CCGT_avoided_storage))*input_parameters{31}
        cycle_EAA_components_std(9) = sqrt(var(SCGT_avoided_storage))*input_parameters{32}

        sum(cycle_EAA_components_mean)

        simulation_results_w_uncertainty_seasons{1}{end+1} = cycle_EAA_components_mean;
        simulation_results_w_uncertainty_seasons{1}{end+1} = cycle_EAA_components_std;
        
        simulation_results_w_uncertainty_seasons{2}{end+1} = cycle_EAA_components_mean;
        simulation_results_w_uncertainty_seasons{2}{end+1} = cycle_EAA_components_std;

    end

    clear simulation_results_w_uncertainty cycle_EAA_seasonal cycle_EAA_components_seasonal
end
