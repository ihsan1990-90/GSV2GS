classdef LEVIS_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        GridLayout                      matlab.ui.container.GridLayout
        LeftPanel                       matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        GridTab                         matlab.ui.container.Tab
        ExistingSCGTcpctyMWEditField    matlab.ui.control.NumericEditField
        ExistingSCGTcpctyMWEditFieldLabel  matlab.ui.control.Label
        ExistingCCGTcpctyMWEditField    matlab.ui.control.NumericEditField
        ExistingCCGTcpctyMWEditFieldLabel  matlab.ui.control.Label
        SummerEditFieldLabel            matlab.ui.control.Label
        WinterEditFieldLabel            matlab.ui.control.Label
        NLbaselinesummerkWEditFieldLabel_3  matlab.ui.control.Label
        NLbaselinesummerkWEditFieldLabel_2  matlab.ui.control.Label
        BaselineSummerEditField         matlab.ui.control.NumericEditField
        PeakloadsummerkWEditField       matlab.ui.control.NumericEditField
        CCGTminloadFPEditField          matlab.ui.control.NumericEditField
        CCGTminloadFPEditFieldLabel     matlab.ui.control.Label
        Button_11                       matlab.ui.control.Button
        LoadsolarwinddailyvariationfactorsEditField  matlab.ui.control.EditField
        LoadsolarwinddailyvariationfactorsEditFieldLabel  matlab.ui.control.Label
        Button_10                       matlab.ui.control.Button
        AutoregressivemodelsparametersEditField  matlab.ui.control.EditField
        Autoregressive1modelsparametersLabel  matlab.ui.control.Label
        WindpowernormalizedhourlyprofilesEditField  matlab.ui.control.EditField
        WindpowernormalizedhourlyprofilesEditFieldLabel  matlab.ui.control.Label
        Button_9                        matlab.ui.control.Button
        SolarPVpowernormalizedhourlyprofilesEditField  matlab.ui.control.EditField
        SolarPVpowernormalizedhourlyprofilesEditFieldLabel  matlab.ui.control.Label
        Button_8                        matlab.ui.control.Button
        Button                          matlab.ui.control.Button
        NormalizedhourlyloadprofileEditField  matlab.ui.control.EditField
        NormalizedhourlyloadprofileEditFieldLabel  matlab.ui.control.Label
        BaselineWinterEditField         matlab.ui.control.NumericEditField
        WindcapacityMWpEditField        matlab.ui.control.NumericEditField
        WindcapacityMWpEditFieldLabel   matlab.ui.control.Label
        SolarcapacityMWpEditField       matlab.ui.control.NumericEditField
        SolarcapacityMWpEditFieldLabel  matlab.ui.control.Label
        PeakloadwinterkWEditField       matlab.ui.control.NumericEditField
        EVsTab                          matlab.ui.container.Tab
        ChargeratekWEditField           matlab.ui.control.NumericEditField
        ChargeratekWEditFieldLabel      matlab.ui.control.Label
        EVtypedistributionPanel         matlab.ui.container.Panel
        CommercialEditField             matlab.ui.control.NumericEditField
        CommercialEditFieldLabel        matlab.ui.control.Label
        EmployeeEditField               matlab.ui.control.NumericEditField
        EmployeeEditFieldLabel          matlab.ui.control.Label
        StayathomeEditField             matlab.ui.control.NumericEditField
        StayathomeEditFieldLabel        matlab.ui.control.Label
        AvgdistancetraveledkmhrEditField_2  matlab.ui.control.NumericEditField
        AvgdistancetraveledkmhrEditField_2Label  matlab.ui.control.Label
        MaxdistancetraveledkmhrEditField  matlab.ui.control.NumericEditField
        MaxdistancetraveledkmhrEditFieldLabel  matlab.ui.control.Label
        TraveldistancebetaEditField     matlab.ui.control.NumericEditField
        TraveldistancebetaEditFieldLabel  matlab.ui.control.Label
        TraveldistancealphaEditField    matlab.ui.control.NumericEditField
        TraveldistancealphaEditFieldLabel  matlab.ui.control.Label
        EVtravelratebetadistributionparametersLabel  matlab.ui.control.Label
        MindistancetraveledkmhrEditField  matlab.ui.control.NumericEditField
        MindistancetraveledkmhrEditFieldLabel  matlab.ui.control.Label
        Button_7                        matlab.ui.control.Button
        EVenergyefficiencieskWhkmEditField  matlab.ui.control.EditField
        EVenergyefficiencieskWhkmEditFieldLabel  matlab.ui.control.Label
        EVbatterydegradationyrEditField  matlab.ui.control.NumericEditField
        EVbatterydegradationyrEditFieldLabel  matlab.ui.control.Label
        DischargingefficiencyEditField  matlab.ui.control.NumericEditField
        DischargingefficiencyEditFieldLabel  matlab.ui.control.Label
        ChargingefficiencyEditField     matlab.ui.control.NumericEditField
        ChargingefficiencyEditFieldLabel  matlab.ui.control.Label
        DischargeratekWEditField        matlab.ui.control.NumericEditField
        DischargeratekWEditFieldLabel   matlab.ui.control.Label
        TotalnumberofEVsEditField       matlab.ui.control.NumericEditField
        TotalnumberofEVsEditFieldLabel  matlab.ui.control.Label
        V2GTab                          matlab.ui.container.Tab
        BaselinebufferEditField         matlab.ui.control.NumericEditField
        BaselinebufferEditFieldLabel    matlab.ui.control.Label
        ChargersperEVEditField          matlab.ui.control.NumericEditField
        ChargersperEVEditFieldLabel     matlab.ui.control.Label
        Button_6                        matlab.ui.control.Button
        Button_5                        matlab.ui.control.Button
        PluginprobabilityprofileshomeEVsEditField  matlab.ui.control.EditField
        PluginprobabilityprofileshomeEVsEditFieldLabel  matlab.ui.control.Label
        PluginprobabilityprofilesemployeeEVsEditField  matlab.ui.control.EditField
        PluginprobabilityprofilesemployeeEVsEditFieldLabel  matlab.ui.control.Label
        PluginprobabilityprofilescommercialEVsEditField  matlab.ui.control.EditField
        PluginprobabilityprofilescommercialEVsEditFieldLabel  matlab.ui.control.Label
        Button_4                        matlab.ui.control.Button
        DelayeddischargewinEditField    matlab.ui.control.NumericEditField
        DelayeddischargewinEditFieldLabel  matlab.ui.control.Label
        PrioritychargewinEditField      matlab.ui.control.NumericEditField
        PrioritychargewinEditFieldLabel  matlab.ui.control.Label
        UnsubscriptionspermonthEditField  matlab.ui.control.NumericEditField
        UnsubscriptionspermonthEditFieldLabel  matlab.ui.control.Label
        V2GdischargeandchargelimitsSlider  matlab.ui.control.RangeSlider
        V2GdischargeandchargelimitsSliderLabel  matlab.ui.control.Label
        BESSTab                         matlab.ui.container.Tab
        CAPEXequivalentEVsEditField     matlab.ui.control.NumericEditField
        CAPEXequivalentEVsEditFieldLabel  matlab.ui.control.Label
        BESSdegradationyrEditField      matlab.ui.control.NumericEditField
        BESSdegradationyrEditFieldLabel  matlab.ui.control.Label
        BESSdischargeandchargelimitsSlider  matlab.ui.control.RangeSlider
        BESSdischargeandchargelimitsSliderLabel  matlab.ui.control.Label
        BESSpowerkWEditField            matlab.ui.control.NumericEditField
        BESSpowerkWEditFieldLabel       matlab.ui.control.Label
        BESScapacitykWhEditField        matlab.ui.control.NumericEditField
        BESScapacitykWhEditFieldLabel   matlab.ui.control.Label
        EconomicTab                     matlab.ui.container.Tab
        BESSOMyrkWhEditField            matlab.ui.control.NumericEditField
        BESSOMyrkWhEditFieldLabel       matlab.ui.control.Label
        V2GchargerlifespanyearsEditField  matlab.ui.control.NumericEditField
        V2GchargerlifespanyearsEditFieldLabel  matlab.ui.control.Label
        ChargerreplacementyrEditField   matlab.ui.control.NumericEditField
        ChargerreplacementyrEditFieldLabel  matlab.ui.control.Label
        SCGTOMkWyrEditField             matlab.ui.control.NumericEditField
        SCGTOMkWyrEditFieldLabel        matlab.ui.control.Label
        CCGTOMkWyrEditField             matlab.ui.control.NumericEditField
        CCGTOMkWyrEditFieldLabel        matlab.ui.control.Label
        PowerplantlifespanyearsEditField  matlab.ui.control.NumericEditField
        PowerplantlifespanyearsEditFieldLabel  matlab.ui.control.Label
        DiscountrateEditField           matlab.ui.control.NumericEditField
        DiscountrateEditFieldLabel      matlab.ui.control.Label
        BESSCAPEXkWhEditField           matlab.ui.control.NumericEditField
        BESSCAPEXkWhEditFieldLabel      matlab.ui.control.Label
        PeakingpremiumkWhEditField      matlab.ui.control.NumericEditField
        PeakingpremiumkWhEditFieldLabel  matlab.ui.control.Label
        SCGTCAPEXkWEditField            matlab.ui.control.NumericEditField
        SCGTCAPEXkWEditFieldLabel       matlab.ui.control.Label
        CCGTCAPEXkWEditField            matlab.ui.control.NumericEditField
        CCGTCAPEXkWEditFieldLabel       matlab.ui.control.Label
        LCOEkWhEditField                matlab.ui.control.NumericEditField
        LCOEkWhEditFieldLabel           matlab.ui.control.Label
        OwnercompenskWhkWhEditField     matlab.ui.control.NumericEditField
        OwnercompenskWhkWhEditFieldLabel  matlab.ui.control.Label
        V2GchargercostEditField         matlab.ui.control.NumericEditField
        V2GchargercostLabel             matlab.ui.control.Label
        SimulationTab                   matlab.ui.container.Tab
        UncertaintyquantificationLabel  matlab.ui.control.Label
        NumberofcyclesSpinner           matlab.ui.control.Spinner
        NumberofcyclesSpinnerLabel      matlab.ui.control.Label
        QuantifyNPVuncertaintySwitch    matlab.ui.control.Switch
        QuantifyNPVuncertaintySwitchLabel  matlab.ui.control.Label
        EVclusteringfactorEditField     matlab.ui.control.NumericEditField
        EVclusteringfactorEditFieldLabel  matlab.ui.control.Label
        MonthoftheyearEditField         matlab.ui.control.NumericEditField
        MonthoftheyearEditFieldLabel    matlab.ui.control.Label
        NumberofsimulateddaysEditField  matlab.ui.control.NumericEditField
        NumberofsimulateddaysEditFieldLabel  matlab.ui.control.Label
        SettingsTab                     matlab.ui.container.Tab
        DarkthemeSwitch                 matlab.ui.control.Switch
        DarkthemeSwitchLabel            matlab.ui.control.Label
        RunSimulationButton             matlab.ui.control.Button
        RightPanel                      matlab.ui.container.Panel
        SeasonButtonGroup               matlab.ui.container.ButtonGroup
        SummerButton                    matlab.ui.control.RadioButton
        WinterButton                    matlab.ui.control.RadioButton
        TabGroup2                       matlab.ui.container.TabGroup
        ResultsTab                      matlab.ui.container.Tab
        RenewablepenetrationGauge       matlab.ui.control.LinearGauge
        RenewablepenetrationGaugeLabel  matlab.ui.control.Label
        PlotdataDropDown                matlab.ui.control.DropDown
        PlotdataDropDownLabel           matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
        ReviewinputdataTab              matlab.ui.container.Tab
        PlotinputsDropDown              matlab.ui.control.DropDown
        PlotinputsDropDownLabel         matlab.ui.control.Label
        UIAxes_2                        matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end


    % Public properties that correspond to the Simulink model
    % properties (Access = public, Transient)
    %    Simulation simulink.Simulation
    % end

    
    properties (Access = private)
        results % Description
        results_season
        input_parameters
        input_files_paths
        uncertainty_data
    end
    
    methods (Access = private)
        
        function update_figure(app, results, input_parameters)
            %simulation_results = {mismatch, c, d, NLV, NLV_V2G, NLV_V2G_BESS, avg_soc, avg_soc_BESS, V2G_LCOS_data, V2G_yearly_consumption, V2G_yearly_discharge, EV_total_discharge_cycles, EV_V2G_discharge_cycles, cars(:,3), NPV_components, NL_metrics, NL_V2G_BESS_metrics};

            switch app.PlotdataDropDown.Value

                case "Net-load without storage"

                    cla(app.UIAxes)
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    plot(app.UIAxes,(1:1440)/60,results{1},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(results{1},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    
                    yline(app.UIAxes, max(max(results{1})),'--','LineWidth',1.5) 
                    yline(app.UIAxes, results{16}(1),'--','LineWidth',1.5)
                    yline(app.UIAxes, (input_parameters{40}/100)*results{16}(1),'--','LineWidth',1.5)

                    txt = ['SCGT capacity: ' newline num2str(results{16}(4), '%.2e') ' kW'];
                    text(app.UIAxes,4,0.95*max(max(results{1})),txt,'FontSize',14)

                    txt = ['CCGT capacity: ' newline num2str(results{16}(1), '%.2e') ' kW'];
                    text(app.UIAxes,8,0.95*results{16}(1),txt,'FontSize',14)

                    txt = ['CCGT CF: ' num2str(100*results{16}(3), '%02.1f') '%'];
                    text(app.UIAxes,6,0.8*results{16}(1),txt,'FontSize',14)

                    txt = ['Curtailment ratio: ' num2str(100*results{18}, '%02.1f') '%'];
                    text(app.UIAxes,6,0.95*(input_parameters{40}/100)*results{16}(1),txt,'FontSize',14)
                    
                    
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'NL (kW)');
                    xlim(app.UIAxes, [0 24])
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")
                    box(app.UIAxes, "on")

                % case "NL-V2G"
                % 
                %     cla(app.UIAxes)
                %     plot(app.UIAxes,(1:1440)/60,results{1}+results{2},'LineWidth',0.5,'Color','red')
                %     hold(app.UIAxes,'on')
                %     plot(app.UIAxes,(1:1440)/60,mean(results{1}+results{2},1),'LineWidth',1.5,'Color','white')
                %     xlabel(app.UIAxes,'Time (hours)');
                %     ylabel(app.UIAxes,'NL-V2G (kW)');
                %     xlim(app.UIAxes, [0 24])
                %     grid(app.UIAxes,"on")
                %     set(app.UIAxes,'FontSize',16)
                %     legend(app.UIAxes, "off")
                % 
                % case "NL-BESS"
                % 
                %     cla(app.UIAxes)
                %     plot(app.UIAxes,(1:1440)/60,results{1}+results{3},'LineWidth',0.5,'Color','red')
                %     hold(app.UIAxes,'on')
                %     plot(app.UIAxes,(1:1440)/60,mean(results{1}+results{3},1),'LineWidth',1.5,'Color','white')
                %     xlabel(app.UIAxes,'Time (hours)');
                %     ylabel(app.UIAxes,'NL-BESS (kW)');
                %     xlim(app.UIAxes, [0 24])
                %     grid(app.UIAxes,"on")
                %     set(app.UIAxes,'FontSize',16)
                %     legend(app.UIAxes, "off")
                
                case "Net-load with storage"

                    cla(app.UIAxes)
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    plot(app.UIAxes,(1:1440)/60,results{1}+results{2}+results{3},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(results{1}+results{2}+results{3},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    
                    yline(app.UIAxes, max(max(results{1}+results{2}+results{3})),'--','LineWidth',1.5) 
                    yline(app.UIAxes, results{17}(1),'--','LineWidth',1.5)
                    yline(app.UIAxes, (input_parameters{40}/100)*results{17}(1),'--','LineWidth',1.5)

                    txt = ['SCGT capacity: ' newline num2str(results{17}(4), '%.2e') ' kW'];
                    text(app.UIAxes,4,0.95*max(max(results{1}+results{2}+results{3})),txt,'FontSize',14)

                    txt = ['CCGT capacity: ' newline num2str(results{17}(1), '%.2e') ' kW'];
                    text(app.UIAxes,8,0.95*results{17}(1),txt,'FontSize',14)

                    txt = ['CCGT CF: ' num2str(100*results{17}(3), '%02.1f') '%'];
                    text(app.UIAxes,6,0.8*results{17}(1),txt,'FontSize',14)

                    txt = ['Curtailment ratio: ' num2str(100*results{19}, '%02.1f') '%'];
                    text(app.UIAxes,6,0.95*(input_parameters{40}/100)*results{17}(1),txt,'FontSize',14)
                    
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'NL-V2G-BESS (kW)');
                    xlim(app.UIAxes,[0 24])
                    grid(app.UIAxes,'on')
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")

                case "V2G-load"
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    cla(app.UIAxes)
                    plot(app.UIAxes,(1:1440)/60,results{2},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(+results{2},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'V2G-load (kW)');
                    xlim(app.UIAxes, [0 24])
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")

                case "BESS-load"
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    cla(app.UIAxes)
                    plot(app.UIAxes,(1:1440)/60,results{3},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(+results{3},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'BESS-load (kW)');
                    xlim(app.UIAxes, [0 24])
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")

                case "Normalized NLV histograms"

                    cla(app.UIAxes)
                    histogram(app.UIAxes,results{4},'BinWidth',0.1E+6,'Normalization','probability')
                    hold(app.UIAxes,'on')
                    % histogram(app.UIAxes,results{5},'BinWidth',0.1E+6,'Normalization','probability')
                    histogram(app.UIAxes,results{6},'BinWidth',0.1E+6,'Normalization','probability')
                    legend(app.UIAxes,"w/o storage","with storage")
                    grid(app.UIAxes,'on')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes,'auto')
                    xlabel(app.UIAxes,'Net-load variance (kW)');
                    ylabel(app.UIAxes,'Probability');

                case "Load duration curve"

                    NLV_Vector = results{4}(:);
                    % NLV_V2G_Vector = results{5}(:);
                    NLV_V2G_BESS_Vector = results{6}(:);
                    sorted_NLV_vector = sort(NLV_Vector, 'descend');
                    % sorted_NLV_V2G_vector = sort(NLV_V2G_Vector, 'descend');
                    sorted_NLV_BESS_vector = sort(NLV_V2G_BESS_Vector, 'descend');
                    minutes = 1:length(sorted_NLV_vector);
                    durationPct = (minutes / length(sorted_NLV_vector)) * 100;
                    
                    cla(app.UIAxes)
                    plot(app.UIAxes, durationPct, sorted_NLV_vector+input_parameters{1}, 'LineWidth', 1.5);
                    hold(app.UIAxes,'on')
                    % plot(app.UIAxes, durationPct, sorted_NLV_V2G_vector+input_parameters{1}, 'LineWidth', 1.5);
                    plot(app.UIAxes, durationPct, sorted_NLV_BESS_vector+input_parameters{1}, 'LineWidth', 1.5);
                    xlabel(app.UIAxes, 'Duration (% of simulation duration)');
                    ylabel(app.UIAxes, 'Net-load variance (kW)');
                    xlim(app.UIAxes,"auto")

                    legend(app.UIAxes,"w/o storage","with storage")
                    grid(app.UIAxes,'on')
                    set(app.UIAxes,'FontSize',16)

                case "EV average SOC profiles"
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    cla(app.UIAxes)
                    plot(app.UIAxes,(1:1440)/60,results{7},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(results{7},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'V2G Avg. SOC (%)');
                    xlim(app.UIAxes, [0 24])
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")

                case "BESS SOC profiles"
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    cla(app.UIAxes)
                    plot(app.UIAxes,(1:1440)/60,results{8},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes,'on')
                    plot(app.UIAxes,(1:1440)/60,mean(results{8},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    xlabel(app.UIAxes,'Time (hours)');
                    ylabel(app.UIAxes,'BESS Avg. SOC (%)');
                    xlim(app.UIAxes, [0 24])
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")
                    
                case "V2G LCOS histogram"
                    cla(app.UIAxes)
                    histogram(app.UIAxes,results{9})
                    xlabel(app.UIAxes, 'LCOS ($/kWh)');
                    ylabel(app.UIAxes, 'Frequency');
                    xlim(app.UIAxes, "auto")
                    grid(app.UIAxes,"on")
                    set(app.UIAxes,'FontSize',16)
                    legend(app.UIAxes, "off")

                case "V2G consumption and discharge histograms"
                    cla(app.UIAxes)
                    h1 = histogram(app.UIAxes, results{10},50);
                    hold(app.UIAxes,"on")
                    grid(app.UIAxes,"on")
                    histogram(app.UIAxes, results{11},"BinWidth",h1.BinWidth);
                    legend(app.UIAxes, 'Seasonal consumption','Seasonal discharge')
                    xlabel(app.UIAxes, 'Energy (kWh/season/EV)')
                    ylabel(app.UIAxes, 'Frequency')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes, "auto")

                case "EV battery cycling data"
                    cla(app.UIAxes)
                    h1 = histogram(app.UIAxes, results{12}, 50);
                    hold(app.UIAxes,"on")
                    grid(app.UIAxes,"on")
                    histogram(app.UIAxes, results{13},"BinWidth",h1.BinWidth);
                    legend(app.UIAxes, 'Seasonal total cycles','Seasonal V2G cycles')
                    xlabel(app.UIAxes, 'Utilization (cycles/season)')
                    ylabel(app.UIAxes, 'Frequency')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes, "auto")

               case "SOC histogram at midnight"
                    cla(app.UIAxes)
                    histogram(app.UIAxes, results{14});
                    grid(app.UIAxes,"on")
                    legend(app.UIAxes, "off")
                    xlabel(app.UIAxes, 'SOC (%)')
                    ylabel(app.UIAxes, 'Frequency')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes, "auto")

                case "EAA seasonal"
                    cla(app.UIAxes)
                    barplot_labels = {'CCGT CAPEX', 'SCGT CAPEX', 'EV CAPEX', 'Peaking premium', 'Avoided curtailment', 'RTEL-V2G & compensation', 'V2G O&M', 'CCGT O&M', 'SCGT O&M','BESS CAPEX','RTEL-BESS','BESS O&M'};
                    % bar(app.UIAxes, barplot_labels, results{15}/(1E+6),'stacked');%'FaceColor','flat');
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end


                    if app.uncertainty_data == false
                        b = bar(app.UIAxes, barplot_labels, results{15}/1e6);
                    elseif app.uncertainty_data
                        b = bar(app.UIAxes, barplot_labels, results{end-4}/1e6);
                        hold(app.UIAxes,"on")
                        errorbar(app.UIAxes, 1:12, results{end-4}/1e6,results{end-3}/1e6,results{end-3}/1e6,"LineStyle","none","Color",nominal_profile_color,'LineWidth',1.5);
                    end


                    b.FaceColor = 'flat';
                    
                    colors = app.UIAxes.ColorOrder;
                    nBars  = numel(results{end-4});
                    b.CData = colors(mod(0:nBars-1, size(colors,1)) + 1, :);
                    b.FaceAlpha = 0.7;

                    if app.uncertainty_data == false
                        txt = ['Net present value:' newline '$ ' num2str(sum(results{15}/1E+6), '%05.1f') ' million'];
                    elseif app.uncertainty_data
                        txt = ['Season EAA: (' num2str(results{end-2}(4), '%02.1f') '%)' newline '$ ' num2str(results{end-2}(2)/1E+6, '%05.1f') ' ± ' num2str(results{end-2}(3)/1E+6, '%05.1f') ' million'];
                    end

                    text(app.UIAxes,4,0.75*max(results{end-4}/1E+6),txt,'FontSize',16, 'FontWeight','bold')
                    
                    grid(app.UIAxes,"on")
                    legend(app.UIAxes, "off")
                    xlabel(app.UIAxes, '')
                    ylabel(app.UIAxes, 'Equivalent annual annuity (M$)')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes, "auto")

                case "Equivalent annual annuity break down"
                    cla(app.UIAxes)
                    barplot_labels = {'CCGT CAPEX', 'SCGT CAPEX', 'EV CAPEX', 'Peaking premium', 'Avoided curtailment', 'RTEL-V2G & compensation', 'V2G O&M', 'CCGT O&M', 'SCGT O&M','BESS CAPEX','RTEL-BESS','BESS O&M'};
                    % bar(app.UIAxes, barplot_labels, results{15}/(1E+6),'stacked');%'FaceColor','flat');
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end

                    if app.uncertainty_data == false
                        b = bar(app.UIAxes, barplot_labels, results{end-1}/1e6);
                    elseif app.uncertainty_data
                        b = bar(app.UIAxes, barplot_labels, results{end-1}/1e6);
                        hold(app.UIAxes,"on")
                        errorbar(app.UIAxes, 1:12, results{end-1}/1e6,results{end}/1e6,results{end}/1e6,"LineStyle","none","Color",nominal_profile_color,'LineWidth',1.5);
                    end


                    b.FaceColor = 'flat';
                    
                    colors = app.UIAxes.ColorOrder;
                    nBars  = numel(results{35});
                    b.CData = colors(mod(0:nBars-1, size(colors,1)) + 1, :);
                    b.FaceAlpha = 0.7;
                    
                    EAA_stdv = sqrt(sum(results{end}.^2));

                    if app.uncertainty_data == false
                        % txt = ['Net present value:' newline '$ ' num2str(sum(results{15}/1E+6), '%05.1f') ' million'];
                    elseif app.uncertainty_data
                        txt = ['Mean EAA: ' newline '$ ' num2str(sum(results{end-1})/1E+6, '%04.1f') ' ± ' num2str(EAA_stdv/1E+6, '%04.1f') ' million'];
                    end

                    text(app.UIAxes,4,0.75*max(results{end-1}/1E+6),txt,'FontSize',16, 'FontWeight','bold')
                    
                    grid(app.UIAxes,"on")
                    legend(app.UIAxes, "off")
                    xlabel(app.UIAxes, '')
                    ylabel(app.UIAxes, 'Equivalent annual annuity (M$)')
                    set(app.UIAxes,'FontSize',16)
                    xlim(app.UIAxes, "auto")

                otherwise
                    
            end
            
        end
    
        function updateProgress(~, dlg, value, message)
            if dlg.CancelRequested
                error('Simulation canceled by user')
            end
    
            dlg.Value   = value;
            dlg.Message = message;
            drawnow
        end

        function update_figure_2(app, results, input_parameters)
            % simulation_results = {mismatch, c, d, NLV, NLV_V2G, NLV_V2G_BESS, avg_soc, avg_soc_BESS, V2G_LCOS_data, V2G_yearly_consumption, V2G_yearly_discharge, EV_total_discharge_cycles, EV_V2G_discharge_cycles, cars(:,3), NPV_components, NL_metrics, NL_V2G_BESS_metrics};

            switch app.PlotinputsDropDown.Value

                case "Load profiles"

                    cla(app.UIAxes_2)
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end

                    % plot(app.UIAxes_2,results{21}(:,1),results{21}(:,2)*results{23},'LineWidth',1.5,'Color',nominal_profile_color)
                    plot(app.UIAxes_2,(1:1440)/60,mean(results{24}),'LineWidth',1.5,'Color',nominal_profile_color)

                    hold(app.UIAxes_2,'on')
                    % plot(app.UIAxes_2,results{22}(:,1),results{22}(:,2)*results{23},'LineWidth',1.5,'Color',nominal_profile_color, LineStyle='--')
                   
                    plot(app.UIAxes_2,(1:1440)/60,results{24},'LineWidth',0.5,'Color','red')
   
                    xlabel(app.UIAxes_2,'Time (hours)');
                    ylabel(app.UIAxes_2,'Load (kW)');
                    xlim(app.UIAxes_2, [0 24])
                    grid(app.UIAxes_2,"on")
                    set(app.UIAxes_2,'FontSize',16)
                    legend(app.UIAxes_2, 'Average','Generated profiles')
                    box(app.UIAxes_2, "on")

                
                case "Solar profiles"

                    cla(app.UIAxes_2)
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    plot(app.UIAxes_2,(1:1440)/60,results{25},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes_2,'on')
                    plot(app.UIAxes_2,(1:1440)/60,mean(results{25},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    
                    xlabel(app.UIAxes_2,'Time (hours)');
                    ylabel(app.UIAxes_2,'Power (kW)');
                    xlim(app.UIAxes_2,[0 24])
                    grid(app.UIAxes_2,'on')
                    set(app.UIAxes_2,'FontSize',16)
                    legend(app.UIAxes_2, "off")

                case "Wind profiles"

                    cla(app.UIAxes_2)
                    if app.DarkthemeSwitch.Value == "On"
                        nominal_profile_color = 'white';
                    else
                        nominal_profile_color = 'black';
                    end
                    plot(app.UIAxes_2,(1:1440)/60,results{26},'LineWidth',0.5,'Color','red')
                    hold(app.UIAxes_2,'on')
                    plot(app.UIAxes_2,(1:1440)/60,mean(results{26},1),'LineWidth',1.5,'Color',nominal_profile_color)
                    
                    xlabel(app.UIAxes_2,'Time (hours)');
                    ylabel(app.UIAxes_2,'Power (kW)');
                    xlim(app.UIAxes_2,[0 24])
                    grid(app.UIAxes_2,'on')
                    set(app.UIAxes_2,'FontSize',16)
                    legend(app.UIAxes_2, "off")

                case "Daily variation factors"

                    cla(app.UIAxes_2)

                    b = bar(app.UIAxes_2, results{27});
                    b(1).FaceColor = "flat";
                    b(2).FaceColor = "flat";
                    b(3).FaceColor = "flat";

                    b(1).FaceAlpha = 0.95;
                    b(2).FaceAlpha = 0.95;
                    b(3).FaceAlpha = 0.95;

                    b(1).EdgeAlpha = 0;
                    b(2).EdgeAlpha = 0;
                    b(3).EdgeAlpha = 0;
                    
                    grid(app.UIAxes_2,"on")
                    legend(app.UIAxes_2, 'load','solar','wind')
                    xlabel(app.UIAxes_2, 'Day')
                    ylabel(app.UIAxes_2, 'Daily scaling factor')
                    set(app.UIAxes_2,'FontSize',16)
                    xlim(app.UIAxes_2, "auto")

                case "Plug-in probabilities"

                    cla(app.UIAxes_2)
                    colors = app.UIAxes.ColorOrder;
                    plot(app.UIAxes_2, results{28}(:,1), results{28}(:,2),'LineStyle','-','Color',colors(1,:),'LineWidth',1.5)
                    hold(app.UIAxes_2,'on')
                    plot(app.UIAxes_2, results{29}(:,1), results{29}(:,2),'LineStyle','--','Color',colors(1,:),'LineWidth',1.5)
                    plot(app.UIAxes_2, results{30}(:,1), results{30}(:,2),'LineStyle','-','Color',colors(2,:),'LineWidth',1.5)
                    plot(app.UIAxes_2, results{31}(:,1), results{31}(:,2),'LineStyle','--','Color',colors(2,:),'LineWidth',1.5)
                    plot(app.UIAxes_2, results{32}(:,1), results{32}(:,2),'LineStyle','-','Color',colors(3,:),'LineWidth',1.5)
                    plot(app.UIAxes_2, results{33}(:,1), results{33}(:,2),'LineStyle','--','Color',colors(3,:),'LineWidth',1.5)

                    legend(app.UIAxes_2,"commercial WD","commercial WE","home WD","home WE","employee WD","employee WE")
                    grid(app.UIAxes_2,'on')
                    set(app.UIAxes_2,'FontSize',16)
                    xlim(app.UIAxes_2,[0, 24])
                    xlabel(app.UIAxes_2,'Time (hours)');
                    ylabel(app.UIAxes_2,'Probability');

                case "EV energy efficiency"

                    cla(app.UIAxes_2)

                    b = bar(app.UIAxes_2, [40,60,80], results{34});
                    b(1).FaceColor = "flat";
                    b(2).FaceColor = "flat";  

                    b(1).FaceAlpha = 0.95;
                    b(2).FaceAlpha = 0.95;                    

                    b(1).EdgeAlpha = 0;
                    b(2).EdgeAlpha = 0;                    
                    
                    grid(app.UIAxes_2,"on")
                    legend(app.UIAxes_2, 'winter','summer')
                    xlabel(app.UIAxes_2, 'Battery size (kWh)')
                    ylabel(app.UIAxes_2, 'Energy economy (kWh/km)')
                    set(app.UIAxes_2,'FontSize',16)
                    xlim(app.UIAxes_2, "auto")
                    xticks(app.UIAxes_2, [40,60,80])

                case "EV travel rate PDF"

                    cla(app.UIAxes_2)

                    alpha = input_parameters{37};
                    beta = input_parameters{38};
                    min_D = input_parameters{36};
                    max_D = input_parameters{41};

                    X = betarnd(alpha, beta, 1E+5, 1);
                    D = min_D + X .* (max_D-min_D);

                    histogram(app.UIAxes_2, D, 100 ,'Normalization', 'pdf');
                    


                    % plot(app.UIAxes_2, results{35}, results{36},'LineWidth',1.5)

                    grid(app.UIAxes_2,'on')
                    set(app.UIAxes_2,'FontSize',16)
                    xlim(app.UIAxes_2,'auto')
                    xlabel(app.UIAxes_2,'Distance (km/hr)');
                    ylabel(app.UIAxes_2,'Probability');
                    xticks(app.UIAxes_2, "auto")
                    legend(app.UIAxes_2, "hide")


                otherwise
                    
            end
            
        end
    
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.Name = 'GSV2GS (v1.0)';
            if isdeployed % works only in deployed mode
                % baseFolder = fileparts(fileparts(fileparts(fileparts(ctfroot)))); % moves up three levels (for mac deployment)
                % baseFolder = fileparts(fileparts(fileparts(ctfroot))); % moves up two levels (for windows deployment)
                % fullpath = fullfile(baseFolder, relativePath);
                [~, baseFolder] = system('where GSV2GS.exe');
                baseFolder = fileparts(baseFolder);
                app.NormalizedhourlyloadprofileEditField.Value = fullfile(baseFolder,app.NormalizedhourlyloadprofileEditField.Value);
                app.AutoregressivemodelsparametersEditField.Value = fullfile(baseFolder,app.AutoregressivemodelsparametersEditField.Value);
                % app.MonthlyloadvariationindicesEditField.Value = fullfile(baseFolder,app.MonthlyloadvariationindicesEditField.Value);
                app.PluginprobabilityprofilescommercialEVsEditField.Value = fullfile(baseFolder,app.PluginprobabilityprofilescommercialEVsEditField.Value);
                app.PluginprobabilityprofilesemployeeEVsEditField.Value = fullfile(baseFolder,app.PluginprobabilityprofilesemployeeEVsEditField.Value);
                app.PluginprobabilityprofileshomeEVsEditField.Value = fullfile(baseFolder,app.PluginprobabilityprofileshomeEVsEditField.Value);
                app.EVenergyefficiencieskWhkmEditField.Value = fullfile(baseFolder,app.EVenergyefficiencieskWhkmEditField.Value);
                app.SolarPVpowernormalizedhourlyprofilesEditField.Value = fullfile(baseFolder,app.SolarPVpowernormalizedhourlyprofilesEditField.Value);
                app.WindpowernormalizedhourlyprofilesEditField.Value = fullfile(baseFolder,app.WindpowernormalizedhourlyprofilesEditField.Value);
                app.LoadsolarwinddailyvariationfactorsEditField.Value = fullfile(baseFolder,app.LoadsolarwinddailyvariationfactorsEditField.Value);
            end
        end

        % Button down function: LeftPanel
        function LeftPanelButtonDown(app, event)
                        
            
        end

        % Button pushed function: RunSimulationButton
        function RunSimulationButtonPushed(app, event)
            % x = 0:0.01:2*pi();
            % if app.PlotdataDropDown.Value == "sin(x)"
            %     y = sin(x);
            % else
            %     y = cos(x);
            % end
            % plot(app.UIAxes, x, y);

            d = uiprogressdlg(app.UIFigure,'Title','Running','Cancelable','on');
                        
            progressFcn = @(p,msg) app.updateProgress(d,p,msg);

            app.results = [];
            app.results_season = 1;
            app.input_parameters{1} = app.TotalnumberofEVsEditField.Value;
            app.input_parameters{2} = app.EVclusteringfactorEditField.Value;
            app.input_parameters{3} = app.BESScapacitykWhEditField.Value;
            app.input_parameters{4} = app.BESSpowerkWEditField.Value;
            app.input_parameters{5} = app.PeakloadwinterkWEditField.Value;
            app.input_parameters{6} = app.SolarcapacityMWpEditField.Value;
            app.input_parameters{7} = app.WindcapacityMWpEditField.Value;
            app.input_parameters{8} = app.BaselineWinterEditField.Value;
            app.input_parameters{9} = app.NumberofsimulateddaysEditField.Value;
            app.input_parameters{10} = app.BaselinebufferEditField.Value;
            app.input_parameters{11} = app.PrioritychargewinEditField.Value;
            app.input_parameters{12} = app.DelayeddischargewinEditField.Value;
            app.input_parameters{13} = app.UnsubscriptionspermonthEditField.Value;
            app.input_parameters{14} = 0; %app.MonthoftheyearEditField.Value;
            app.input_parameters{15} = app.ChargingefficiencyEditField.Value;
            app.input_parameters{16} = app.DischargingefficiencyEditField.Value;
            app.input_parameters{17} = app.V2GdischargeandchargelimitsSlider.Value(2);
            app.input_parameters{18} = app.V2GdischargeandchargelimitsSlider.Value(1);
            app.input_parameters{19} = app.ChargeratekWEditField.Value;
            app.input_parameters{20} = app.EVbatterydegradationyrEditField.Value;
            app.input_parameters{21} = app.ChargersperEVEditField.Value;
            app.input_parameters{22} = app.V2GchargercostEditField.Value;
            app.input_parameters{23} = app.OwnercompenskWhkWhEditField.Value;
            app.input_parameters{24} = app.LCOEkWhEditField.Value;
            app.input_parameters{25} = app.CCGTCAPEXkWEditField.Value;
            app.input_parameters{26} = app.SCGTCAPEXkWEditField.Value;
            app.input_parameters{27} = app.PeakingpremiumkWhEditField.Value;
            app.input_parameters{28} = app.BESSCAPEXkWhEditField.Value;
            app.input_parameters{29} = app.DiscountrateEditField.Value;
            app.input_parameters{30} = app.PowerplantlifespanyearsEditField.Value;
            app.input_parameters{31} = app.CCGTOMkWyrEditField.Value;
            app.input_parameters{32} = app.SCGTOMkWyrEditField.Value;
            app.input_parameters{33} = app.ChargerreplacementyrEditField.Value;
            app.input_parameters{34} = app.BESSdischargeandchargelimitsSlider.Value(1);
            app.input_parameters{35} = app.BESSdischargeandchargelimitsSlider.Value(2);
            app.input_parameters{36} = app.MindistancetraveledkmhrEditField.Value; % min distance
            app.input_parameters{37} = app.TraveldistancealphaEditField.Value;
            app.input_parameters{38} = app.TraveldistancebetaEditField.Value;
            app.input_parameters{39} = app.BESSdegradationyrEditField.Value;
            app.input_parameters{40} = app.CCGTminloadFPEditField.Value;
            app.input_parameters{41} = app.MaxdistancetraveledkmhrEditField.Value; % max distance
            app.input_parameters{42} = app.PeakloadsummerkWEditField.Value; % peak load during summer
            app.input_parameters{43} = app.BaselineSummerEditField.Value; % net-load during summer season
            app.input_parameters{44} = app.StayathomeEditField.Value;
            app.input_parameters{45} = app.CommercialEditField.Value;
            app.input_parameters{46} = app.EmployeeEditField.Value;
            app.input_parameters{47} = app.V2GchargerlifespanyearsEditField.Value;
            app.input_parameters{48} = app.DischargeratekWEditField.Value;
            app.input_parameters{49} = app.BESSOMyrkWhEditField.Value;
            app.input_parameters{50} = app.ExistingCCGTcpctyMWEditField.Value;
            app.input_parameters{51} = app.ExistingSCGTcpctyMWEditField.Value;
            
            app.input_files_paths{1} = app.NormalizedhourlyloadprofileEditField.Value;
            app.input_files_paths{2} = app.AutoregressivemodelsparametersEditField.Value;
            app.input_files_paths{3} = '';% app.MonthlyloadvariationindicesEditField.Value;
            app.input_files_paths{4} = app.PluginprobabilityprofilescommercialEVsEditField.Value;
            app.input_files_paths{5} = app.PluginprobabilityprofilesemployeeEVsEditField.Value;
            app.input_files_paths{6} = app.PluginprobabilityprofileshomeEVsEditField.Value;
            app.input_files_paths{7} = app.EVenergyefficiencieskWhkmEditField.Value;
            app.input_files_paths{8} = app.SolarPVpowernormalizedhourlyprofilesEditField.Value;
            app.input_files_paths{9} = app.WindpowernormalizedhourlyprofilesEditField.Value;
            app.input_files_paths{10} = app.LoadsolarwinddailyvariationfactorsEditField.Value;
            

            if app.QuantifyNPVuncertaintySwitch.Value == "Off"
                
                app.results = simulation_main_func(app.input_parameters, app.input_files_paths, progressFcn, 0, 0);
                app.uncertainty_data = false;
            elseif app.QuantifyNPVuncertaintySwitch.Value == "On"
                
                app.results = multi_cycle_func(app.input_parameters, app.input_files_paths, progressFcn, app.NumberofcyclesSpinner.Value);
                app.uncertainty_data = true;
            end
            
            app.UIAxes.Visible = "on";
            app.PlotdataDropDown.Enable = "on";

            app.UIAxes_2.Visible = "on";
            app.PlotinputsDropDown.Enable = "on";

            app.RenewablepenetrationGauge.Enable = "on";
            app.RenewablepenetrationGauge.Value = 100*app.results{app.results_season}{20};


            update_figure(app, app.results{app.results_season}, app.input_parameters)
            update_figure_2(app, app.results{app.results_season}, app.input_parameters)

            close(d)
            

        end

        % Value changed function: PlotdataDropDown
        function PlotdataDropDownValueChanged(app, event)
            % value = app.PlotdataDropDown.Value;
            
            update_figure(app, app.results{app.results_season}, app.input_parameters)
        end

        % Value changing function: NormalizedhourlyloadprofileEditField
        function NormalizedhourlyloadprofileEditFieldValueChanging(app, event)
            %changingValue = event.Value;
            
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.NormalizedhourlyloadprofileEditField.Value = fullpath;
        end

        % Button pushed function: Button_4
        function Button_4Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.PluginprobabilityprofilescommercialEVsEditField.Value = fullpath; 
        end

        % Button pushed function: Button_5
        function Button_5Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.PluginprobabilityprofilesemployeeEVsEditField.Value = fullpath; 
        end

        % Button pushed function: Button_6
        function Button_6Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.PluginprobabilityprofileshomeEVsEditField.Value = fullpath;
        end

        % Button pushed function: Button_7
        function Button_7Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.EVenergyefficiencieskWhkmEditField.Value = fullpath;
        end

        % Button pushed function: Button_8
        function Button_8Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.SolarPVpowernormalizedhourlyprofilesEditField.Value = fullpath;
        end

        % Button pushed function: Button_9
        function Button_9Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.WindpowernormalizedhourlyprofilesEditField.Value = fullpath;
        end

        % Button pushed function: Button_10
        function Button_10Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.Autoregressive1modelsparametersLabel.Value = fullpath;
        end

        % Button pushed function: Button_11
        function Button_11Pushed(app, event)
            [file, path] = uigetfile( ...
                {'*.csv','CSV Files'; '*.*','All Files'}, ...
                'Select input file');
    
            if isequal(file,0)
                return    % user canceled
            end
        
            fullpath = fullfile(path, file);
            
            app.LoadsolarwinddailyvariationfactorsEditField.Value = fullpath;
        end

        % Value changed function: QuantifyNPVuncertaintySwitch
        function QuantifyNPVuncertaintySwitchValueChanged(app, event)
            value = app.QuantifyNPVuncertaintySwitch.Value;
            if value == "On"
                app.NumberofcyclesSpinner.Enable = "on";
                
            else
                app.NumberofcyclesSpinner.Enable = "off";
            end
        end

        % Value changed function: DarkthemeSwitch
        function DarkthemeSwitchValueChanged(app, event)
            value = app.DarkthemeSwitch.Value;
            if value == "Off"
                % app.UIFigure.Theme = "light";
                theme(app.UIFigure, "light");
            else
                % app.UIFigure.Theme = "dark";
                theme(app.UIFigure, "dark");
            end
            if isempty(app.results)
            else
                update_figure(app, app.results{app.results_season}, app.input_parameters)
                update_figure_2(app, app.results{app.results_season}, app.input_parameters)
            end
        end

        % Value changed function: PlotinputsDropDown
        function PlotinputsDropDownValueChanged(app, event)
            %value = app.PlotinputsDropDown.Value;
            update_figure_2(app, app.results{app.results_season}, app.input_parameters)
        end

        % Value changed function: BaselineWinterEditField
        function BaselineWinterEditFieldValueChanged(app, event)
            value = app.BaselineWinterEditField.Value;
            if value > app.PeakloadwinterkWEditField.Value
                app.BaselineWinterEditField.Value = app.PeakloadwinterkWEditField.Value;
            end
        end

        % Value changed function: MindistancetraveledkmhrEditField
        function MindistancetraveledkmhrEditFieldValueChanged(app, event)
            value = app.MindistancetraveledkmhrEditField.Value;
            max = app.MaxdistancetraveledkmhrEditField.Value;
            alpha = app.TraveldistancealphaEditField.Value;
            beta = app.TraveldistancebetaEditField.Value;
            app.AvgdistancetraveledkmhrEditField_2.Value = value + (alpha / (alpha + beta)) * (max - value);
        end

        % Value changed function: MaxdistancetraveledkmhrEditField
        function MaxdistancetraveledkmhrEditFieldValueChanged(app, event)
            value = app.MaxdistancetraveledkmhrEditField.Value;
            min = app.MindistancetraveledkmhrEditField.Value;
            alpha = app.TraveldistancealphaEditField.Value;
            beta = app.TraveldistancebetaEditField.Value;
            app.AvgdistancetraveledkmhrEditField_2.Value = min + (alpha / (alpha + beta)) * (value - min);
        end

        % Value changed function: TraveldistancealphaEditField
        function TraveldistancealphaEditFieldValueChanged(app, event)
            % value = app.TraveldistancealphaEditField.Value;
            value = app.MaxdistancetraveledkmhrEditField.Value;
            min = app.MindistancetraveledkmhrEditField.Value;
            alpha = app.TraveldistancealphaEditField.Value;
            beta = app.TraveldistancebetaEditField.Value;
            app.AvgdistancetraveledkmhrEditField_2.Value = min + (alpha / (alpha + beta)) * (value - min);
            
        end

        % Value changed function: TraveldistancebetaEditField
        function TraveldistancebetaEditFieldValueChanged(app, event)
            % value = app.TraveldistancebetaEditField.Value;
            value = app.MaxdistancetraveledkmhrEditField.Value;
            min = app.MindistancetraveledkmhrEditField.Value;
            alpha = app.TraveldistancealphaEditField.Value;
            beta = app.TraveldistancebetaEditField.Value;
            app.AvgdistancetraveledkmhrEditField_2.Value = min + (alpha / (alpha + beta)) * (value - min);
        end

        % Value changed function: BESScapacitykWhEditField
        function BESScapacitykWhEditFieldValueChanged(app, event)
            BESS_capacity = app.BESScapacitykWhEditField.Value;
            BESS_capex = app.BESSCAPEXkWhEditField.Value;
            V2G_capex = (app.V2GchargercostEditField.Value)*(app.ChargersperEVEditField.Value);
            app.CAPEXequivalentEVsEditField.Value = BESS_capacity*BESS_capex/V2G_capex;
        end

        % Value changed function: BESSCAPEXkWhEditField
        function BESSCAPEXkWhEditFieldValueChanged(app, event)
            BESS_capacity = app.BESScapacitykWhEditField.Value;
            BESS_capex = app.BESSCAPEXkWhEditField.Value;
            V2G_capex = (app.V2GchargercostEditField.Value)*(app.ChargersperEVEditField.Value);
            app.CAPEXequivalentEVsEditField.Value = BESS_capacity*BESS_capex/V2G_capex;
            
        end

        % Value changed function: V2GchargercostEditField
        function V2GchargercostEditFieldValueChanged(app, event)
            BESS_capacity = app.BESScapacitykWhEditField.Value;
            BESS_capex = app.BESSCAPEXkWhEditField.Value;
            V2G_capex = (app.V2GchargercostEditField.Value)*(app.ChargersperEVEditField.Value);
            app.CAPEXequivalentEVsEditField.Value = BESS_capacity*BESS_capex/V2G_capex;
            
        end

        % Value changed function: ChargersperEVEditField
        function ChargersperEVEditFieldValueChanged(app, event)
            BESS_capacity = app.BESScapacitykWhEditField.Value;
            BESS_capex = app.BESSCAPEXkWhEditField.Value;
            V2G_capex = (app.V2GchargercostEditField.Value)*(app.ChargersperEVEditField.Value);
            app.CAPEXequivalentEVsEditField.Value = BESS_capacity*BESS_capex/V2G_capex;
            
        end

        % Selection changed function: SeasonButtonGroup
        function SeasonButtonGroupSelectionChanged(app, event)
            selectedButton = app.SeasonButtonGroup.SelectedObject.Text;
            if selectedButton == "Winter"
                app.results_season = 1;
            elseif selectedButton == "Summer"
                app.results_season = 2;
            end
            update_figure(app, app.results{app.results_season}, app.input_parameters)
            update_figure_2(app, app.results{app.results_season}, app.input_parameters)
            app.RenewablepenetrationGauge.Value = 100*app.results{app.results_season}{20};
        end

        % Value changed function: StayathomeEditField
        function StayathomeEditFieldValueChanged(app, event)
            value = app.StayathomeEditField.Value;
            if (app.StayathomeEditField.Value + app.CommercialEditField.Value) > 100
                app.StayathomeEditField.Value = 0;
                
            end
            app.EmployeeEditField.Value = 100 - (app.StayathomeEditField.Value + app.CommercialEditField.Value);
        end

        % Value changed function: CommercialEditField
        function CommercialEditFieldValueChanged(app, event)
            value = app.CommercialEditField.Value;
            if (app.StayathomeEditField.Value + app.CommercialEditField.Value) > 100
                app.CommercialEditField.Value = 0;
                
            end
            app.EmployeeEditField.Value = 100 - (app.StayathomeEditField.Value + app.CommercialEditField.Value);
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {683, 683};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {404, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1108 683];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Theme = 'dark';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {404, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.BorderWidth = 2;
            app.LeftPanel.Title = 'Input parameters';
            app.LeftPanel.ButtonDownFcn = createCallbackFcn(app, @LeftPanelButtonDown, true);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;
            app.LeftPanel.FontAngle = 'italic';
            app.LeftPanel.FontSize = 16;

            % Create RunSimulationButton
            app.RunSimulationButton = uibutton(app.LeftPanel, 'push');
            app.RunSimulationButton.ButtonPushedFcn = createCallbackFcn(app, @RunSimulationButtonPushed, true);
            app.RunSimulationButton.BackgroundColor = [0.902 0.902 0.902];
            app.RunSimulationButton.FontSize = 16;
            app.RunSimulationButton.FontWeight = 'bold';
            app.RunSimulationButton.FontColor = [0.502 0.502 0.502];
            app.RunSimulationButton.Position = [10 15 382 47];
            app.RunSimulationButton.Text = 'Run Simulation';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.LeftPanel);
            app.TabGroup.TabLocation = 'left';
            app.TabGroup.Position = [2 77 400 576];

            % Create GridTab
            app.GridTab = uitab(app.TabGroup);
            app.GridTab.Title = 'Grid';

            % Create PeakloadwinterkWEditField
            app.PeakloadwinterkWEditField = uieditfield(app.GridTab, 'numeric');
            app.PeakloadwinterkWEditField.Limits = [100 100000000];
            app.PeakloadwinterkWEditField.FontSize = 14;
            app.PeakloadwinterkWEditField.FontWeight = 'bold';
            app.PeakloadwinterkWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.PeakloadwinterkWEditField.Position = [140 519 72 22];
            app.PeakloadwinterkWEditField.Value = 5900000;

            % Create SolarcapacityMWpEditFieldLabel
            app.SolarcapacityMWpEditFieldLabel = uilabel(app.GridTab);
            app.SolarcapacityMWpEditFieldLabel.HorizontalAlignment = 'right';
            app.SolarcapacityMWpEditFieldLabel.FontSize = 14;
            app.SolarcapacityMWpEditFieldLabel.Position = [42 450 139 22];
            app.SolarcapacityMWpEditFieldLabel.Text = 'Solar capacity (MWp)';

            % Create SolarcapacityMWpEditField
            app.SolarcapacityMWpEditField = uieditfield(app.GridTab, 'numeric');
            app.SolarcapacityMWpEditField.Limits = [100 100000000];
            app.SolarcapacityMWpEditField.FontSize = 14;
            app.SolarcapacityMWpEditField.FontWeight = 'bold';
            app.SolarcapacityMWpEditField.FontColor = [0.4392 0.6902 0.8706];
            app.SolarcapacityMWpEditField.Position = [196 450 100 22];
            app.SolarcapacityMWpEditField.Value = 6000;

            % Create WindcapacityMWpEditFieldLabel
            app.WindcapacityMWpEditFieldLabel = uilabel(app.GridTab);
            app.WindcapacityMWpEditFieldLabel.HorizontalAlignment = 'right';
            app.WindcapacityMWpEditFieldLabel.FontSize = 14;
            app.WindcapacityMWpEditFieldLabel.Position = [42 417 139 22];
            app.WindcapacityMWpEditFieldLabel.Text = 'Wind capacity (MWp)';

            % Create WindcapacityMWpEditField
            app.WindcapacityMWpEditField = uieditfield(app.GridTab, 'numeric');
            app.WindcapacityMWpEditField.Limits = [100 100000000];
            app.WindcapacityMWpEditField.FontSize = 14;
            app.WindcapacityMWpEditField.FontWeight = 'bold';
            app.WindcapacityMWpEditField.FontColor = [0.4392 0.6902 0.8706];
            app.WindcapacityMWpEditField.Position = [196 417 100 22];
            app.WindcapacityMWpEditField.Value = 1100;

            % Create BaselineWinterEditField
            app.BaselineWinterEditField = uieditfield(app.GridTab, 'numeric');
            app.BaselineWinterEditField.Limits = [0 Inf];
            app.BaselineWinterEditField.ValueChangedFcn = createCallbackFcn(app, @BaselineWinterEditFieldValueChanged, true);
            app.BaselineWinterEditField.FontSize = 14;
            app.BaselineWinterEditField.FontWeight = 'bold';
            app.BaselineWinterEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BaselineWinterEditField.Tooltip = {'Net-load baseline during winter season.'};
            app.BaselineWinterEditField.Position = [141 491 72 22];
            app.BaselineWinterEditField.Value = 3800000;

            % Create NormalizedhourlyloadprofileEditFieldLabel
            app.NormalizedhourlyloadprofileEditFieldLabel = uilabel(app.GridTab);
            app.NormalizedhourlyloadprofileEditFieldLabel.HorizontalAlignment = 'right';
            app.NormalizedhourlyloadprofileEditFieldLabel.FontSize = 14;
            app.NormalizedhourlyloadprofileEditFieldLabel.Position = [57 275 193 22];
            app.NormalizedhourlyloadprofileEditFieldLabel.Text = 'Normalized hourly load profile';

            % Create NormalizedhourlyloadprofileEditField
            app.NormalizedhourlyloadprofileEditField = uieditfield(app.GridTab, 'text');
            app.NormalizedhourlyloadprofileEditField.ValueChangingFcn = createCallbackFcn(app, @NormalizedhourlyloadprofileEditFieldValueChanging, true);
            app.NormalizedhourlyloadprofileEditField.Editable = 'off';
            app.NormalizedhourlyloadprofileEditField.FontSize = 14;
            app.NormalizedhourlyloadprofileEditField.FontColor = [0.7529 0.3608 0.9843];
            app.NormalizedhourlyloadprofileEditField.Position = [24 247 240 22];
            app.NormalizedhourlyloadprofileEditField.Value = 'input_data/avg_combined_load.csv';

            % Create Button
            app.Button = uibutton(app.GridTab, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.FontSize = 14;
            app.Button.FontWeight = 'bold';
            app.Button.Position = [269 245 25 25];
            app.Button.Text = ':';

            % Create Button_8
            app.Button_8 = uibutton(app.GridTab, 'push');
            app.Button_8.ButtonPushedFcn = createCallbackFcn(app, @Button_8Pushed, true);
            app.Button_8.FontSize = 14;
            app.Button_8.FontWeight = 'bold';
            app.Button_8.Position = [269 185 25 25];
            app.Button_8.Text = ':';

            % Create SolarPVpowernormalizedhourlyprofilesEditFieldLabel
            app.SolarPVpowernormalizedhourlyprofilesEditFieldLabel = uilabel(app.GridTab);
            app.SolarPVpowernormalizedhourlyprofilesEditFieldLabel.HorizontalAlignment = 'right';
            app.SolarPVpowernormalizedhourlyprofilesEditFieldLabel.FontSize = 14;
            app.SolarPVpowernormalizedhourlyprofilesEditFieldLabel.Position = [19 214 269 22];
            app.SolarPVpowernormalizedhourlyprofilesEditFieldLabel.Text = 'Solar PV power normalized hourly profiles';

            % Create SolarPVpowernormalizedhourlyprofilesEditField
            app.SolarPVpowernormalizedhourlyprofilesEditField = uieditfield(app.GridTab, 'text');
            app.SolarPVpowernormalizedhourlyprofilesEditField.Editable = 'off';
            app.SolarPVpowernormalizedhourlyprofilesEditField.FontSize = 14;
            app.SolarPVpowernormalizedhourlyprofilesEditField.FontColor = [0.7529 0.3608 0.9843];
            app.SolarPVpowernormalizedhourlyprofilesEditField.Position = [25 186 240 22];
            app.SolarPVpowernormalizedhourlyprofilesEditField.Value = 'input_data/solar_generation.csv';

            % Create Button_9
            app.Button_9 = uibutton(app.GridTab, 'push');
            app.Button_9.ButtonPushedFcn = createCallbackFcn(app, @Button_9Pushed, true);
            app.Button_9.FontSize = 14;
            app.Button_9.FontWeight = 'bold';
            app.Button_9.Position = [269 128 25 25];
            app.Button_9.Text = ':';

            % Create WindpowernormalizedhourlyprofilesEditFieldLabel
            app.WindpowernormalizedhourlyprofilesEditFieldLabel = uilabel(app.GridTab);
            app.WindpowernormalizedhourlyprofilesEditFieldLabel.HorizontalAlignment = 'right';
            app.WindpowernormalizedhourlyprofilesEditFieldLabel.FontSize = 14;
            app.WindpowernormalizedhourlyprofilesEditFieldLabel.Position = [30 157 247 22];
            app.WindpowernormalizedhourlyprofilesEditFieldLabel.Text = 'Wind power normalized hourly profiles';

            % Create WindpowernormalizedhourlyprofilesEditField
            app.WindpowernormalizedhourlyprofilesEditField = uieditfield(app.GridTab, 'text');
            app.WindpowernormalizedhourlyprofilesEditField.Editable = 'off';
            app.WindpowernormalizedhourlyprofilesEditField.FontSize = 14;
            app.WindpowernormalizedhourlyprofilesEditField.FontColor = [0.7529 0.3608 0.9843];
            app.WindpowernormalizedhourlyprofilesEditField.Position = [25 129 240 22];
            app.WindpowernormalizedhourlyprofilesEditField.Value = 'input_data/wind_generation.csv';

            % Create Autoregressive1modelsparametersLabel
            app.Autoregressive1modelsparametersLabel = uilabel(app.GridTab);
            app.Autoregressive1modelsparametersLabel.HorizontalAlignment = 'right';
            app.Autoregressive1modelsparametersLabel.FontSize = 14;
            app.Autoregressive1modelsparametersLabel.Position = [37 100 228 22];
            app.Autoregressive1modelsparametersLabel.Text = 'Autoregressive models'' parameters';

            % Create AutoregressivemodelsparametersEditField
            app.AutoregressivemodelsparametersEditField = uieditfield(app.GridTab, 'text');
            app.AutoregressivemodelsparametersEditField.Editable = 'off';
            app.AutoregressivemodelsparametersEditField.FontSize = 14;
            app.AutoregressivemodelsparametersEditField.FontColor = [0.7529 0.3608 0.9843];
            app.AutoregressivemodelsparametersEditField.Position = [25 72 240 22];
            app.AutoregressivemodelsparametersEditField.Value = 'input_data/AR_models_parameters.csv';

            % Create Button_10
            app.Button_10 = uibutton(app.GridTab, 'push');
            app.Button_10.ButtonPushedFcn = createCallbackFcn(app, @Button_10Pushed, true);
            app.Button_10.FontSize = 14;
            app.Button_10.FontWeight = 'bold';
            app.Button_10.Position = [269 73 25 25];
            app.Button_10.Text = ':';

            % Create LoadsolarwinddailyvariationfactorsEditFieldLabel
            app.LoadsolarwinddailyvariationfactorsEditFieldLabel = uilabel(app.GridTab);
            app.LoadsolarwinddailyvariationfactorsEditFieldLabel.HorizontalAlignment = 'right';
            app.LoadsolarwinddailyvariationfactorsEditFieldLabel.FontSize = 14;
            app.LoadsolarwinddailyvariationfactorsEditFieldLabel.Position = [20 43 261 22];
            app.LoadsolarwinddailyvariationfactorsEditFieldLabel.Text = 'Load, solar & wind daily variation factors';

            % Create LoadsolarwinddailyvariationfactorsEditField
            app.LoadsolarwinddailyvariationfactorsEditField = uieditfield(app.GridTab, 'text');
            app.LoadsolarwinddailyvariationfactorsEditField.Editable = 'off';
            app.LoadsolarwinddailyvariationfactorsEditField.FontSize = 14;
            app.LoadsolarwinddailyvariationfactorsEditField.FontColor = [0.7529 0.3608 0.9843];
            app.LoadsolarwinddailyvariationfactorsEditField.Position = [25 15 240 22];
            app.LoadsolarwinddailyvariationfactorsEditField.Value = 'input_data/daily_variation_factors.csv';

            % Create Button_11
            app.Button_11 = uibutton(app.GridTab, 'push');
            app.Button_11.ButtonPushedFcn = createCallbackFcn(app, @Button_11Pushed, true);
            app.Button_11.FontSize = 14;
            app.Button_11.FontWeight = 'bold';
            app.Button_11.Position = [269 14 25 25];
            app.Button_11.Text = ':';

            % Create CCGTminloadFPEditFieldLabel
            app.CCGTminloadFPEditFieldLabel = uilabel(app.GridTab);
            app.CCGTminloadFPEditFieldLabel.HorizontalAlignment = 'center';
            app.CCGTminloadFPEditFieldLabel.FontSize = 14;
            app.CCGTminloadFPEditFieldLabel.Position = [34 319 148 22];
            app.CCGTminloadFPEditFieldLabel.Text = 'CCGT min. load (%FP)';

            % Create CCGTminloadFPEditField
            app.CCGTminloadFPEditField = uieditfield(app.GridTab, 'numeric');
            app.CCGTminloadFPEditField.Limits = [0 100];
            app.CCGTminloadFPEditField.FontSize = 14;
            app.CCGTminloadFPEditField.FontWeight = 'bold';
            app.CCGTminloadFPEditField.FontColor = [0.4392 0.6902 0.8706];
            app.CCGTminloadFPEditField.Position = [196 319 100 22];
            app.CCGTminloadFPEditField.Value = 40;

            % Create PeakloadsummerkWEditField
            app.PeakloadsummerkWEditField = uieditfield(app.GridTab, 'numeric');
            app.PeakloadsummerkWEditField.Limits = [100 100000000];
            app.PeakloadsummerkWEditField.FontSize = 14;
            app.PeakloadsummerkWEditField.FontWeight = 'bold';
            app.PeakloadsummerkWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.PeakloadsummerkWEditField.Position = [224 519 72 22];
            app.PeakloadsummerkWEditField.Value = 6100000;

            % Create BaselineSummerEditField
            app.BaselineSummerEditField = uieditfield(app.GridTab, 'numeric');
            app.BaselineSummerEditField.Limits = [0 Inf];
            app.BaselineSummerEditField.FontSize = 14;
            app.BaselineSummerEditField.FontWeight = 'bold';
            app.BaselineSummerEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BaselineSummerEditField.Tooltip = {'Net-load baseline during summer season.'};
            app.BaselineSummerEditField.Position = [224 491 72 22];
            app.BaselineSummerEditField.Value = 4000000;

            % Create NLbaselinesummerkWEditFieldLabel_2
            app.NLbaselinesummerkWEditFieldLabel_2 = uilabel(app.GridTab);
            app.NLbaselinesummerkWEditFieldLabel_2.HorizontalAlignment = 'center';
            app.NLbaselinesummerkWEditFieldLabel_2.FontSize = 14;
            app.NLbaselinesummerkWEditFieldLabel_2.Position = [20 491 110 22];
            app.NLbaselinesummerkWEditFieldLabel_2.Text = 'NL baseline (kW)';

            % Create NLbaselinesummerkWEditFieldLabel_3
            app.NLbaselinesummerkWEditFieldLabel_3 = uilabel(app.GridTab);
            app.NLbaselinesummerkWEditFieldLabel_3.HorizontalAlignment = 'center';
            app.NLbaselinesummerkWEditFieldLabel_3.FontSize = 14;
            app.NLbaselinesummerkWEditFieldLabel_3.Position = [26 519 99 22];
            app.NLbaselinesummerkWEditFieldLabel_3.Text = 'Peak load (kW)';

            % Create WinterEditFieldLabel
            app.WinterEditFieldLabel = uilabel(app.GridTab);
            app.WinterEditFieldLabel.HorizontalAlignment = 'center';
            app.WinterEditFieldLabel.FontSize = 14;
            app.WinterEditFieldLabel.Position = [152 546 45 22];
            app.WinterEditFieldLabel.Text = 'Winter';

            % Create SummerEditFieldLabel
            app.SummerEditFieldLabel = uilabel(app.GridTab);
            app.SummerEditFieldLabel.HorizontalAlignment = 'center';
            app.SummerEditFieldLabel.FontSize = 14;
            app.SummerEditFieldLabel.Position = [231 546 58 22];
            app.SummerEditFieldLabel.Text = 'Summer';

            % Create ExistingCCGTcpctyMWEditFieldLabel
            app.ExistingCCGTcpctyMWEditFieldLabel = uilabel(app.GridTab);
            app.ExistingCCGTcpctyMWEditFieldLabel.HorizontalAlignment = 'right';
            app.ExistingCCGTcpctyMWEditFieldLabel.FontSize = 14;
            app.ExistingCCGTcpctyMWEditFieldLabel.Position = [6 384 175 22];
            app.ExistingCCGTcpctyMWEditFieldLabel.Text = 'Existing CCGT cpcty. (MW)';

            % Create ExistingCCGTcpctyMWEditField
            app.ExistingCCGTcpctyMWEditField = uieditfield(app.GridTab, 'numeric');
            app.ExistingCCGTcpctyMWEditField.Limits = [100 100000000];
            app.ExistingCCGTcpctyMWEditField.FontSize = 14;
            app.ExistingCCGTcpctyMWEditField.FontWeight = 'bold';
            app.ExistingCCGTcpctyMWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ExistingCCGTcpctyMWEditField.Position = [196 384 100 22];
            app.ExistingCCGTcpctyMWEditField.Value = 3400;

            % Create ExistingSCGTcpctyMWEditFieldLabel
            app.ExistingSCGTcpctyMWEditFieldLabel = uilabel(app.GridTab);
            app.ExistingSCGTcpctyMWEditFieldLabel.HorizontalAlignment = 'right';
            app.ExistingSCGTcpctyMWEditFieldLabel.FontSize = 14;
            app.ExistingSCGTcpctyMWEditFieldLabel.Position = [8 351 174 22];
            app.ExistingSCGTcpctyMWEditFieldLabel.Text = 'Existing SCGT cpcty. (MW)';

            % Create ExistingSCGTcpctyMWEditField
            app.ExistingSCGTcpctyMWEditField = uieditfield(app.GridTab, 'numeric');
            app.ExistingSCGTcpctyMWEditField.Limits = [100 100000000];
            app.ExistingSCGTcpctyMWEditField.FontSize = 14;
            app.ExistingSCGTcpctyMWEditField.FontWeight = 'bold';
            app.ExistingSCGTcpctyMWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ExistingSCGTcpctyMWEditField.Position = [197 351 100 22];
            app.ExistingSCGTcpctyMWEditField.Value = 800;

            % Create EVsTab
            app.EVsTab = uitab(app.TabGroup);
            app.EVsTab.Title = 'EVs';

            % Create TotalnumberofEVsEditFieldLabel
            app.TotalnumberofEVsEditFieldLabel = uilabel(app.EVsTab);
            app.TotalnumberofEVsEditFieldLabel.HorizontalAlignment = 'right';
            app.TotalnumberofEVsEditFieldLabel.FontSize = 14;
            app.TotalnumberofEVsEditFieldLabel.Position = [50 544 131 22];
            app.TotalnumberofEVsEditFieldLabel.Text = 'Total number of EVs';

            % Create TotalnumberofEVsEditField
            app.TotalnumberofEVsEditField = uieditfield(app.EVsTab, 'numeric');
            app.TotalnumberofEVsEditField.Limits = [0 10000000];
            app.TotalnumberofEVsEditField.ValueDisplayFormat = '%.0f';
            app.TotalnumberofEVsEditField.FontSize = 14;
            app.TotalnumberofEVsEditField.FontWeight = 'bold';
            app.TotalnumberofEVsEditField.FontColor = [0.4392 0.6902 0.8706];
            app.TotalnumberofEVsEditField.Position = [196 544 100 22];
            app.TotalnumberofEVsEditField.Value = 100000;

            % Create DischargeratekWEditFieldLabel
            app.DischargeratekWEditFieldLabel = uilabel(app.EVsTab);
            app.DischargeratekWEditFieldLabel.HorizontalAlignment = 'right';
            app.DischargeratekWEditFieldLabel.FontSize = 14;
            app.DischargeratekWEditFieldLabel.Position = [54 296 127 22];
            app.DischargeratekWEditFieldLabel.Text = 'Discharge rate (kW)';

            % Create DischargeratekWEditField
            app.DischargeratekWEditField = uieditfield(app.EVsTab, 'numeric');
            app.DischargeratekWEditField.Limits = [1 100];
            app.DischargeratekWEditField.FontSize = 14;
            app.DischargeratekWEditField.FontWeight = 'bold';
            app.DischargeratekWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.DischargeratekWEditField.Position = [196 296 100 22];
            app.DischargeratekWEditField.Value = 7;

            % Create ChargingefficiencyEditFieldLabel
            app.ChargingefficiencyEditFieldLabel = uilabel(app.EVsTab);
            app.ChargingefficiencyEditFieldLabel.HorizontalAlignment = 'center';
            app.ChargingefficiencyEditFieldLabel.FontSize = 14;
            app.ChargingefficiencyEditFieldLabel.Position = [32 264 150 22];
            app.ChargingefficiencyEditFieldLabel.Text = 'Charging efficiency (%)';

            % Create ChargingefficiencyEditField
            app.ChargingefficiencyEditField = uieditfield(app.EVsTab, 'numeric');
            app.ChargingefficiencyEditField.Limits = [0 100];
            app.ChargingefficiencyEditField.FontSize = 14;
            app.ChargingefficiencyEditField.FontWeight = 'bold';
            app.ChargingefficiencyEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ChargingefficiencyEditField.Position = [196 264 100 22];
            app.ChargingefficiencyEditField.Value = 90;

            % Create DischargingefficiencyEditFieldLabel
            app.DischargingefficiencyEditFieldLabel = uilabel(app.EVsTab);
            app.DischargingefficiencyEditFieldLabel.HorizontalAlignment = 'center';
            app.DischargingefficiencyEditFieldLabel.FontSize = 14;
            app.DischargingefficiencyEditFieldLabel.Position = [15 232 167 22];
            app.DischargingefficiencyEditFieldLabel.Text = 'Discharging efficiency (%)';

            % Create DischargingefficiencyEditField
            app.DischargingefficiencyEditField = uieditfield(app.EVsTab, 'numeric');
            app.DischargingefficiencyEditField.Limits = [0 100];
            app.DischargingefficiencyEditField.FontSize = 14;
            app.DischargingefficiencyEditField.FontWeight = 'bold';
            app.DischargingefficiencyEditField.FontColor = [0.4392 0.6902 0.8706];
            app.DischargingefficiencyEditField.Position = [196 232 100 22];
            app.DischargingefficiencyEditField.Value = 90;

            % Create EVbatterydegradationyrEditFieldLabel
            app.EVbatterydegradationyrEditFieldLabel = uilabel(app.EVsTab);
            app.EVbatterydegradationyrEditFieldLabel.HorizontalAlignment = 'center';
            app.EVbatterydegradationyrEditFieldLabel.FontSize = 14;
            app.EVbatterydegradationyrEditFieldLabel.Position = [5 200 191 22];
            app.EVbatterydegradationyrEditFieldLabel.Text = 'EV battery degradation (%/yr)';

            % Create EVbatterydegradationyrEditField
            app.EVbatterydegradationyrEditField = uieditfield(app.EVsTab, 'numeric');
            app.EVbatterydegradationyrEditField.Limits = [0 10];
            app.EVbatterydegradationyrEditField.FontSize = 14;
            app.EVbatterydegradationyrEditField.FontWeight = 'bold';
            app.EVbatterydegradationyrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.EVbatterydegradationyrEditField.Position = [196 199 100 22];
            app.EVbatterydegradationyrEditField.Value = 3;

            % Create EVenergyefficiencieskWhkmEditFieldLabel
            app.EVenergyefficiencieskWhkmEditFieldLabel = uilabel(app.EVsTab);
            app.EVenergyefficiencieskWhkmEditFieldLabel.HorizontalAlignment = 'right';
            app.EVenergyefficiencieskWhkmEditFieldLabel.FontSize = 14;
            app.EVenergyefficiencieskWhkmEditFieldLabel.Position = [41 394 206 22];
            app.EVenergyefficiencieskWhkmEditFieldLabel.Text = 'EV energy efficiencies (kWh/km)';

            % Create EVenergyefficiencieskWhkmEditField
            app.EVenergyefficiencieskWhkmEditField = uieditfield(app.EVsTab, 'text');
            app.EVenergyefficiencieskWhkmEditField.Editable = 'off';
            app.EVenergyefficiencieskWhkmEditField.FontSize = 14;
            app.EVenergyefficiencieskWhkmEditField.FontColor = [0.7529 0.3608 0.9843];
            app.EVenergyefficiencieskWhkmEditField.Position = [22 366 240 22];
            app.EVenergyefficiencieskWhkmEditField.Value = 'input_data/energy_effeciency.csv';

            % Create Button_7
            app.Button_7 = uibutton(app.EVsTab, 'push');
            app.Button_7.ButtonPushedFcn = createCallbackFcn(app, @Button_7Pushed, true);
            app.Button_7.FontSize = 14;
            app.Button_7.FontWeight = 'bold';
            app.Button_7.Position = [267 365 25 25];
            app.Button_7.Text = ':';

            % Create MindistancetraveledkmhrEditFieldLabel
            app.MindistancetraveledkmhrEditFieldLabel = uilabel(app.EVsTab);
            app.MindistancetraveledkmhrEditFieldLabel.HorizontalAlignment = 'center';
            app.MindistancetraveledkmhrEditFieldLabel.FontSize = 14;
            app.MindistancetraveledkmhrEditFieldLabel.Position = [7 135 191 22];
            app.MindistancetraveledkmhrEditFieldLabel.Text = 'Min. distance traveled (km/hr)';

            % Create MindistancetraveledkmhrEditField
            app.MindistancetraveledkmhrEditField = uieditfield(app.EVsTab, 'numeric');
            app.MindistancetraveledkmhrEditField.Limits = [2 120];
            app.MindistancetraveledkmhrEditField.ValueChangedFcn = createCallbackFcn(app, @MindistancetraveledkmhrEditFieldValueChanged, true);
            app.MindistancetraveledkmhrEditField.FontSize = 14;
            app.MindistancetraveledkmhrEditField.FontWeight = 'bold';
            app.MindistancetraveledkmhrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.MindistancetraveledkmhrEditField.Tooltip = {'Average distance travelled per hour while EV is unplugged, accounting for possiblity of unplugged parking.'};
            app.MindistancetraveledkmhrEditField.Position = [196 135 100 22];
            app.MindistancetraveledkmhrEditField.Value = 6;

            % Create EVtravelratebetadistributionparametersLabel
            app.EVtravelratebetadistributionparametersLabel = uilabel(app.EVsTab);
            app.EVtravelratebetadistributionparametersLabel.BackgroundColor = [0.149 0.149 0.149];
            app.EVtravelratebetadistributionparametersLabel.HorizontalAlignment = 'center';
            app.EVtravelratebetadistributionparametersLabel.FontSize = 14;
            app.EVtravelratebetadistributionparametersLabel.FontWeight = 'bold';
            app.EVtravelratebetadistributionparametersLabel.FontColor = [1 1 1];
            app.EVtravelratebetadistributionparametersLabel.Position = [10 168 291 22];
            app.EVtravelratebetadistributionparametersLabel.Text = 'EV travel rate beta distribution parameters';

            % Create TraveldistancealphaEditFieldLabel
            app.TraveldistancealphaEditFieldLabel = uilabel(app.EVsTab);
            app.TraveldistancealphaEditFieldLabel.HorizontalAlignment = 'center';
            app.TraveldistancealphaEditFieldLabel.FontSize = 14;
            app.TraveldistancealphaEditFieldLabel.Position = [51 72 137 22];
            app.TraveldistancealphaEditFieldLabel.Text = 'Travel distance alpha';

            % Create TraveldistancealphaEditField
            app.TraveldistancealphaEditField = uieditfield(app.EVsTab, 'numeric');
            app.TraveldistancealphaEditField.Limits = [0 100];
            app.TraveldistancealphaEditField.ValueChangedFcn = createCallbackFcn(app, @TraveldistancealphaEditFieldValueChanged, true);
            app.TraveldistancealphaEditField.FontSize = 14;
            app.TraveldistancealphaEditField.FontWeight = 'bold';
            app.TraveldistancealphaEditField.FontColor = [0.4392 0.6902 0.8706];
            app.TraveldistancealphaEditField.Tooltip = {'Average distance travelled per hour while EV is unplugged, accounting for possiblity of unplugged parking.'};
            app.TraveldistancealphaEditField.Position = [196 72 100 22];
            app.TraveldistancealphaEditField.Value = 2;

            % Create TraveldistancebetaEditFieldLabel
            app.TraveldistancebetaEditFieldLabel = uilabel(app.EVsTab);
            app.TraveldistancebetaEditFieldLabel.HorizontalAlignment = 'center';
            app.TraveldistancebetaEditFieldLabel.FontSize = 14;
            app.TraveldistancebetaEditFieldLabel.Position = [56 41 130 22];
            app.TraveldistancebetaEditFieldLabel.Text = 'Travel distance beta';

            % Create TraveldistancebetaEditField
            app.TraveldistancebetaEditField = uieditfield(app.EVsTab, 'numeric');
            app.TraveldistancebetaEditField.Limits = [0 100];
            app.TraveldistancebetaEditField.ValueChangedFcn = createCallbackFcn(app, @TraveldistancebetaEditFieldValueChanged, true);
            app.TraveldistancebetaEditField.FontSize = 14;
            app.TraveldistancebetaEditField.FontWeight = 'bold';
            app.TraveldistancebetaEditField.FontColor = [0.4392 0.6902 0.8706];
            app.TraveldistancebetaEditField.Tooltip = {'Average distance travelled per hour while EV is unplugged, accounting for possiblity of unplugged parking.'};
            app.TraveldistancebetaEditField.Position = [196 41 100 22];
            app.TraveldistancebetaEditField.Value = 16;

            % Create MaxdistancetraveledkmhrEditFieldLabel
            app.MaxdistancetraveledkmhrEditFieldLabel = uilabel(app.EVsTab);
            app.MaxdistancetraveledkmhrEditFieldLabel.HorizontalAlignment = 'center';
            app.MaxdistancetraveledkmhrEditFieldLabel.FontSize = 14;
            app.MaxdistancetraveledkmhrEditFieldLabel.Position = [5 103 195 22];
            app.MaxdistancetraveledkmhrEditFieldLabel.Text = 'Max. distance traveled (km/hr)';

            % Create MaxdistancetraveledkmhrEditField
            app.MaxdistancetraveledkmhrEditField = uieditfield(app.EVsTab, 'numeric');
            app.MaxdistancetraveledkmhrEditField.Limits = [2 120];
            app.MaxdistancetraveledkmhrEditField.ValueChangedFcn = createCallbackFcn(app, @MaxdistancetraveledkmhrEditFieldValueChanged, true);
            app.MaxdistancetraveledkmhrEditField.FontSize = 14;
            app.MaxdistancetraveledkmhrEditField.FontWeight = 'bold';
            app.MaxdistancetraveledkmhrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.MaxdistancetraveledkmhrEditField.Tooltip = {'Average distance travelled per hour while EV is unplugged, accounting for possiblity of unplugged parking.'};
            app.MaxdistancetraveledkmhrEditField.Position = [196 103 100 22];
            app.MaxdistancetraveledkmhrEditField.Value = 80;

            % Create AvgdistancetraveledkmhrEditField_2Label
            app.AvgdistancetraveledkmhrEditField_2Label = uilabel(app.EVsTab);
            app.AvgdistancetraveledkmhrEditField_2Label.HorizontalAlignment = 'center';
            app.AvgdistancetraveledkmhrEditField_2Label.FontSize = 14;
            app.AvgdistancetraveledkmhrEditField_2Label.Enable = 'off';
            app.AvgdistancetraveledkmhrEditField_2Label.Position = [7 10 192 22];
            app.AvgdistancetraveledkmhrEditField_2Label.Text = 'Avg. distance traveled (km/hr)';

            % Create AvgdistancetraveledkmhrEditField_2
            app.AvgdistancetraveledkmhrEditField_2 = uieditfield(app.EVsTab, 'numeric');
            app.AvgdistancetraveledkmhrEditField_2.Limits = [2 120];
            app.AvgdistancetraveledkmhrEditField_2.Editable = 'off';
            app.AvgdistancetraveledkmhrEditField_2.FontSize = 14;
            app.AvgdistancetraveledkmhrEditField_2.FontWeight = 'bold';
            app.AvgdistancetraveledkmhrEditField_2.FontColor = [0.4392 0.6902 0.8706];
            app.AvgdistancetraveledkmhrEditField_2.Enable = 'off';
            app.AvgdistancetraveledkmhrEditField_2.Tooltip = {'Average distance travelled per hour while EV is unplugged, accounting for possiblity of unplugged parking.'};
            app.AvgdistancetraveledkmhrEditField_2.Position = [196 10 100 22];
            app.AvgdistancetraveledkmhrEditField_2.Value = 14.22;

            % Create EVtypedistributionPanel
            app.EVtypedistributionPanel = uipanel(app.EVsTab);
            app.EVtypedistributionPanel.Title = 'EV type distribution';
            app.EVtypedistributionPanel.Position = [1 423 311 114];

            % Create StayathomeEditFieldLabel
            app.StayathomeEditFieldLabel = uilabel(app.EVtypedistributionPanel);
            app.StayathomeEditFieldLabel.HorizontalAlignment = 'right';
            app.StayathomeEditFieldLabel.Position = [80 64 98 22];
            app.StayathomeEditFieldLabel.Text = 'Stay at home (%)';

            % Create StayathomeEditField
            app.StayathomeEditField = uieditfield(app.EVtypedistributionPanel, 'numeric');
            app.StayathomeEditField.Limits = [0 100];
            app.StayathomeEditField.ValueChangedFcn = createCallbackFcn(app, @StayathomeEditFieldValueChanged, true);
            app.StayathomeEditField.FontWeight = 'bold';
            app.StayathomeEditField.FontColor = [0.4392 0.6902 0.8706];
            app.StayathomeEditField.Position = [193 64 100 22];
            app.StayathomeEditField.Value = 30;

            % Create EmployeeEditFieldLabel
            app.EmployeeEditFieldLabel = uilabel(app.EVtypedistributionPanel);
            app.EmployeeEditFieldLabel.HorizontalAlignment = 'right';
            app.EmployeeEditFieldLabel.Enable = 'off';
            app.EmployeeEditFieldLabel.Position = [98 9 80 22];
            app.EmployeeEditFieldLabel.Text = 'Employee (%)';

            % Create EmployeeEditField
            app.EmployeeEditField = uieditfield(app.EVtypedistributionPanel, 'numeric');
            app.EmployeeEditField.Limits = [0 100];
            app.EmployeeEditField.FontWeight = 'bold';
            app.EmployeeEditField.FontColor = [0.4392 0.6902 0.8706];
            app.EmployeeEditField.Enable = 'off';
            app.EmployeeEditField.Position = [193 9 100 22];
            app.EmployeeEditField.Value = 40;

            % Create CommercialEditFieldLabel
            app.CommercialEditFieldLabel = uilabel(app.EVtypedistributionPanel);
            app.CommercialEditFieldLabel.HorizontalAlignment = 'right';
            app.CommercialEditFieldLabel.Position = [87 37 91 22];
            app.CommercialEditFieldLabel.Text = 'Commercial (%)';

            % Create CommercialEditField
            app.CommercialEditField = uieditfield(app.EVtypedistributionPanel, 'numeric');
            app.CommercialEditField.Limits = [0 100];
            app.CommercialEditField.ValueChangedFcn = createCallbackFcn(app, @CommercialEditFieldValueChanged, true);
            app.CommercialEditField.FontWeight = 'bold';
            app.CommercialEditField.FontColor = [0.4392 0.6902 0.8706];
            app.CommercialEditField.Position = [193 37 100 22];
            app.CommercialEditField.Value = 30;

            % Create ChargeratekWEditFieldLabel
            app.ChargeratekWEditFieldLabel = uilabel(app.EVsTab);
            app.ChargeratekWEditFieldLabel.HorizontalAlignment = 'right';
            app.ChargeratekWEditFieldLabel.FontSize = 14;
            app.ChargeratekWEditFieldLabel.Position = [71 328 110 22];
            app.ChargeratekWEditFieldLabel.Text = 'Charge rate (kW)';

            % Create ChargeratekWEditField
            app.ChargeratekWEditField = uieditfield(app.EVsTab, 'numeric');
            app.ChargeratekWEditField.Limits = [1 100];
            app.ChargeratekWEditField.FontSize = 14;
            app.ChargeratekWEditField.FontWeight = 'bold';
            app.ChargeratekWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ChargeratekWEditField.Position = [196 328 100 22];
            app.ChargeratekWEditField.Value = 7;

            % Create V2GTab
            app.V2GTab = uitab(app.TabGroup);
            app.V2GTab.Title = 'V2G';

            % Create V2GdischargeandchargelimitsSliderLabel
            app.V2GdischargeandchargelimitsSliderLabel = uilabel(app.V2GTab);
            app.V2GdischargeandchargelimitsSliderLabel.HorizontalAlignment = 'right';
            app.V2GdischargeandchargelimitsSliderLabel.FontSize = 14;
            app.V2GdischargeandchargelimitsSliderLabel.Position = [33 355 235 22];
            app.V2GdischargeandchargelimitsSliderLabel.Text = 'V2G discharge and charge limits (%)';

            % Create V2GdischargeandchargelimitsSlider
            app.V2GdischargeandchargelimitsSlider = uislider(app.V2GTab, 'range');
            app.V2GdischargeandchargelimitsSlider.Step = 1;
            app.V2GdischargeandchargelimitsSlider.FontSize = 14;
            app.V2GdischargeandchargelimitsSlider.Position = [27 336 249 3];
            app.V2GdischargeandchargelimitsSlider.Value = [35 85];

            % Create UnsubscriptionspermonthEditFieldLabel
            app.UnsubscriptionspermonthEditFieldLabel = uilabel(app.V2GTab);
            app.UnsubscriptionspermonthEditFieldLabel.HorizontalAlignment = 'right';
            app.UnsubscriptionspermonthEditFieldLabel.FontSize = 14;
            app.UnsubscriptionspermonthEditFieldLabel.Position = [6 508 175 22];
            app.UnsubscriptionspermonthEditFieldLabel.Text = 'Unsubscriptions per month';

            % Create UnsubscriptionspermonthEditField
            app.UnsubscriptionspermonthEditField = uieditfield(app.V2GTab, 'numeric');
            app.UnsubscriptionspermonthEditField.Limits = [0 10];
            app.UnsubscriptionspermonthEditField.FontSize = 14;
            app.UnsubscriptionspermonthEditField.FontWeight = 'bold';
            app.UnsubscriptionspermonthEditField.FontColor = [0.4392 0.6902 0.8706];
            app.UnsubscriptionspermonthEditField.Position = [196 508 100 22];
            app.UnsubscriptionspermonthEditField.Value = 4;

            % Create PrioritychargewinEditFieldLabel
            app.PrioritychargewinEditFieldLabel = uilabel(app.V2GTab);
            app.PrioritychargewinEditFieldLabel.HorizontalAlignment = 'center';
            app.PrioritychargewinEditFieldLabel.FontSize = 14;
            app.PrioritychargewinEditFieldLabel.Position = [31 475 150 22];
            app.PrioritychargewinEditFieldLabel.Text = 'Priority charge win. (%)';

            % Create PrioritychargewinEditField
            app.PrioritychargewinEditField = uieditfield(app.V2GTab, 'numeric');
            app.PrioritychargewinEditField.Limits = [0 10];
            app.PrioritychargewinEditField.FontSize = 14;
            app.PrioritychargewinEditField.FontWeight = 'bold';
            app.PrioritychargewinEditField.FontColor = [0.4392 0.6902 0.8706];
            app.PrioritychargewinEditField.Position = [196 475 100 22];
            app.PrioritychargewinEditField.Value = 5;

            % Create DelayeddischargewinEditFieldLabel
            app.DelayeddischargewinEditFieldLabel = uilabel(app.V2GTab);
            app.DelayeddischargewinEditFieldLabel.HorizontalAlignment = 'center';
            app.DelayeddischargewinEditFieldLabel.FontSize = 14;
            app.DelayeddischargewinEditFieldLabel.Position = [6 443 175 22];
            app.DelayeddischargewinEditFieldLabel.Text = 'Delayed discharge win. (%)';

            % Create DelayeddischargewinEditField
            app.DelayeddischargewinEditField = uieditfield(app.V2GTab, 'numeric');
            app.DelayeddischargewinEditField.Limits = [0 10];
            app.DelayeddischargewinEditField.FontSize = 14;
            app.DelayeddischargewinEditField.FontWeight = 'bold';
            app.DelayeddischargewinEditField.FontColor = [0.4392 0.6902 0.8706];
            app.DelayeddischargewinEditField.Position = [196 443 100 22];
            app.DelayeddischargewinEditField.Value = 5;

            % Create Button_4
            app.Button_4 = uibutton(app.V2GTab, 'push');
            app.Button_4.ButtonPushedFcn = createCallbackFcn(app, @Button_4Pushed, true);
            app.Button_4.FontSize = 14;
            app.Button_4.FontWeight = 'bold';
            app.Button_4.Position = [267 224 25 25];
            app.Button_4.Text = ':';

            % Create PluginprobabilityprofilescommercialEVsEditFieldLabel
            app.PluginprobabilityprofilescommercialEVsEditFieldLabel = uilabel(app.V2GTab);
            app.PluginprobabilityprofilescommercialEVsEditFieldLabel.HorizontalAlignment = 'right';
            app.PluginprobabilityprofilescommercialEVsEditFieldLabel.FontSize = 14;
            app.PluginprobabilityprofilescommercialEVsEditFieldLabel.Position = [7 253 283 22];
            app.PluginprobabilityprofilescommercialEVsEditFieldLabel.Text = 'Plug-in probability profiles (commercial EVs)';

            % Create PluginprobabilityprofilescommercialEVsEditField
            app.PluginprobabilityprofilescommercialEVsEditField = uieditfield(app.V2GTab, 'text');
            app.PluginprobabilityprofilescommercialEVsEditField.Editable = 'off';
            app.PluginprobabilityprofilescommercialEVsEditField.FontSize = 14;
            app.PluginprobabilityprofilescommercialEVsEditField.FontColor = [0.7529 0.3608 0.9843];
            app.PluginprobabilityprofilescommercialEVsEditField.Position = [19 225 240 22];
            app.PluginprobabilityprofilescommercialEVsEditField.Value = 'input_data/commercialpluggedprobability.csv';

            % Create PluginprobabilityprofilesemployeeEVsEditFieldLabel
            app.PluginprobabilityprofilesemployeeEVsEditFieldLabel = uilabel(app.V2GTab);
            app.PluginprobabilityprofilesemployeeEVsEditFieldLabel.HorizontalAlignment = 'right';
            app.PluginprobabilityprofilesemployeeEVsEditFieldLabel.FontSize = 14;
            app.PluginprobabilityprofilesemployeeEVsEditFieldLabel.Position = [13 189 271 22];
            app.PluginprobabilityprofilesemployeeEVsEditFieldLabel.Text = 'Plug-in probability profiles (employee EVs)';

            % Create PluginprobabilityprofilesemployeeEVsEditField
            app.PluginprobabilityprofilesemployeeEVsEditField = uieditfield(app.V2GTab, 'text');
            app.PluginprobabilityprofilesemployeeEVsEditField.Editable = 'off';
            app.PluginprobabilityprofilesemployeeEVsEditField.FontSize = 14;
            app.PluginprobabilityprofilesemployeeEVsEditField.FontColor = [0.7529 0.3608 0.9843];
            app.PluginprobabilityprofilesemployeeEVsEditField.Position = [19 161 240 22];
            app.PluginprobabilityprofilesemployeeEVsEditField.Value = 'input_data/employeepluggedprobability.csv';

            % Create PluginprobabilityprofileshomeEVsEditFieldLabel
            app.PluginprobabilityprofileshomeEVsEditFieldLabel = uilabel(app.V2GTab);
            app.PluginprobabilityprofileshomeEVsEditFieldLabel.HorizontalAlignment = 'right';
            app.PluginprobabilityprofileshomeEVsEditFieldLabel.FontSize = 14;
            app.PluginprobabilityprofileshomeEVsEditFieldLabel.Position = [26 125 245 22];
            app.PluginprobabilityprofileshomeEVsEditFieldLabel.Text = 'Plug-in probability profiles (home EVs)';

            % Create PluginprobabilityprofileshomeEVsEditField
            app.PluginprobabilityprofileshomeEVsEditField = uieditfield(app.V2GTab, 'text');
            app.PluginprobabilityprofileshomeEVsEditField.Editable = 'off';
            app.PluginprobabilityprofileshomeEVsEditField.FontSize = 14;
            app.PluginprobabilityprofileshomeEVsEditField.FontColor = [0.7529 0.3608 0.9843];
            app.PluginprobabilityprofileshomeEVsEditField.Position = [19 97 240 22];
            app.PluginprobabilityprofileshomeEVsEditField.Value = 'input_data/homepluggedprobability.csv';

            % Create Button_5
            app.Button_5 = uibutton(app.V2GTab, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_5Pushed, true);
            app.Button_5.FontSize = 14;
            app.Button_5.FontWeight = 'bold';
            app.Button_5.Position = [267 159 25 25];
            app.Button_5.Text = ':';

            % Create Button_6
            app.Button_6 = uibutton(app.V2GTab, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.FontSize = 14;
            app.Button_6.FontWeight = 'bold';
            app.Button_6.Position = [267 96 25 25];
            app.Button_6.Text = ':';

            % Create ChargersperEVEditFieldLabel
            app.ChargersperEVEditFieldLabel = uilabel(app.V2GTab);
            app.ChargersperEVEditFieldLabel.HorizontalAlignment = 'center';
            app.ChargersperEVEditFieldLabel.FontSize = 14;
            app.ChargersperEVEditFieldLabel.Position = [74 541 107 22];
            app.ChargersperEVEditFieldLabel.Text = 'Chargers per EV';

            % Create ChargersperEVEditField
            app.ChargersperEVEditField = uieditfield(app.V2GTab, 'numeric');
            app.ChargersperEVEditField.Limits = [1 5];
            app.ChargersperEVEditField.ValueChangedFcn = createCallbackFcn(app, @ChargersperEVEditFieldValueChanged, true);
            app.ChargersperEVEditField.FontSize = 14;
            app.ChargersperEVEditField.FontWeight = 'bold';
            app.ChargersperEVEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ChargersperEVEditField.Position = [196 541 100 22];
            app.ChargersperEVEditField.Value = 1.5;

            % Create BaselinebufferEditFieldLabel
            app.BaselinebufferEditFieldLabel = uilabel(app.V2GTab);
            app.BaselinebufferEditFieldLabel.HorizontalAlignment = 'center';
            app.BaselinebufferEditFieldLabel.FontSize = 14;
            app.BaselinebufferEditFieldLabel.Position = [57 411 124 22];
            app.BaselinebufferEditFieldLabel.Text = 'Baseline buffer (%)';

            % Create BaselinebufferEditField
            app.BaselinebufferEditField = uieditfield(app.V2GTab, 'numeric');
            app.BaselinebufferEditField.Limits = [0 10];
            app.BaselinebufferEditField.FontSize = 14;
            app.BaselinebufferEditField.FontWeight = 'bold';
            app.BaselinebufferEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BaselinebufferEditField.Position = [196 411 100 22];
            app.BaselinebufferEditField.Value = 2.5;

            % Create BESSTab
            app.BESSTab = uitab(app.TabGroup);
            app.BESSTab.Title = 'BESS';

            % Create BESScapacitykWhEditFieldLabel
            app.BESScapacitykWhEditFieldLabel = uilabel(app.BESSTab);
            app.BESScapacitykWhEditFieldLabel.HorizontalAlignment = 'right';
            app.BESScapacitykWhEditFieldLabel.FontSize = 14;
            app.BESScapacitykWhEditFieldLabel.Position = [45 541 137 22];
            app.BESScapacitykWhEditFieldLabel.Text = 'BESS capacity (kWh)';

            % Create BESScapacitykWhEditField
            app.BESScapacitykWhEditField = uieditfield(app.BESSTab, 'numeric');
            app.BESScapacitykWhEditField.Limits = [0 100000000];
            app.BESScapacitykWhEditField.ValueChangedFcn = createCallbackFcn(app, @BESScapacitykWhEditFieldValueChanged, true);
            app.BESScapacitykWhEditField.FontSize = 14;
            app.BESScapacitykWhEditField.FontWeight = 'bold';
            app.BESScapacitykWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BESScapacitykWhEditField.Position = [196 541 100 22];

            % Create BESSpowerkWEditFieldLabel
            app.BESSpowerkWEditFieldLabel = uilabel(app.BESSTab);
            app.BESSpowerkWEditFieldLabel.HorizontalAlignment = 'right';
            app.BESSpowerkWEditFieldLabel.FontSize = 14;
            app.BESSpowerkWEditFieldLabel.Position = [66 471 116 22];
            app.BESSpowerkWEditFieldLabel.Text = 'BESS power (kW)';

            % Create BESSpowerkWEditField
            app.BESSpowerkWEditField = uieditfield(app.BESSTab, 'numeric');
            app.BESSpowerkWEditField.Limits = [0 25000000];
            app.BESSpowerkWEditField.FontSize = 14;
            app.BESSpowerkWEditField.FontWeight = 'bold';
            app.BESSpowerkWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BESSpowerkWEditField.Position = [196 471 100 22];

            % Create BESSdischargeandchargelimitsSliderLabel
            app.BESSdischargeandchargelimitsSliderLabel = uilabel(app.BESSTab);
            app.BESSdischargeandchargelimitsSliderLabel.HorizontalAlignment = 'right';
            app.BESSdischargeandchargelimitsSliderLabel.FontSize = 14;
            app.BESSdischargeandchargelimitsSliderLabel.Position = [27 387 244 22];
            app.BESSdischargeandchargelimitsSliderLabel.Text = 'BESS discharge and charge limits (%)';

            % Create BESSdischargeandchargelimitsSlider
            app.BESSdischargeandchargelimitsSlider = uislider(app.BESSTab, 'range');
            app.BESSdischargeandchargelimitsSlider.Step = 1;
            app.BESSdischargeandchargelimitsSlider.FontSize = 14;
            app.BESSdischargeandchargelimitsSlider.Position = [26 363 249 3];
            app.BESSdischargeandchargelimitsSlider.Value = [10 90];

            % Create BESSdegradationyrEditFieldLabel
            app.BESSdegradationyrEditFieldLabel = uilabel(app.BESSTab);
            app.BESSdegradationyrEditFieldLabel.HorizontalAlignment = 'right';
            app.BESSdegradationyrEditFieldLabel.FontSize = 14;
            app.BESSdegradationyrEditFieldLabel.Position = [20 437 162 22];
            app.BESSdegradationyrEditFieldLabel.Text = 'BESS degradation (%/yr)';

            % Create BESSdegradationyrEditField
            app.BESSdegradationyrEditField = uieditfield(app.BESSTab, 'numeric');
            app.BESSdegradationyrEditField.Limits = [0 10];
            app.BESSdegradationyrEditField.FontSize = 14;
            app.BESSdegradationyrEditField.FontWeight = 'bold';
            app.BESSdegradationyrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BESSdegradationyrEditField.Position = [196 437 100 22];
            app.BESSdegradationyrEditField.Value = 3;

            % Create CAPEXequivalentEVsEditFieldLabel
            app.CAPEXequivalentEVsEditFieldLabel = uilabel(app.BESSTab);
            app.CAPEXequivalentEVsEditFieldLabel.HorizontalAlignment = 'right';
            app.CAPEXequivalentEVsEditFieldLabel.FontSize = 14;
            app.CAPEXequivalentEVsEditFieldLabel.Enable = 'off';
            app.CAPEXequivalentEVsEditFieldLabel.Position = [28 506 154 22];
            app.CAPEXequivalentEVsEditFieldLabel.Text = 'CAPEX equivalent (EVs)';

            % Create CAPEXequivalentEVsEditField
            app.CAPEXequivalentEVsEditField = uieditfield(app.BESSTab, 'numeric');
            app.CAPEXequivalentEVsEditField.Limits = [0 100000000];
            app.CAPEXequivalentEVsEditField.Editable = 'off';
            app.CAPEXequivalentEVsEditField.FontSize = 14;
            app.CAPEXequivalentEVsEditField.FontWeight = 'bold';
            app.CAPEXequivalentEVsEditField.FontColor = [0.4392 0.6902 0.8706];
            app.CAPEXequivalentEVsEditField.Enable = 'off';
            app.CAPEXequivalentEVsEditField.Position = [196 506 100 22];

            % Create EconomicTab
            app.EconomicTab = uitab(app.TabGroup);
            app.EconomicTab.Title = 'Economic';

            % Create V2GchargercostLabel
            app.V2GchargercostLabel = uilabel(app.EconomicTab);
            app.V2GchargercostLabel.HorizontalAlignment = 'center';
            app.V2GchargercostLabel.FontSize = 14;
            app.V2GchargercostLabel.Position = [58 541 133 22];
            app.V2GchargercostLabel.Text = 'V2G charger cost ($)';

            % Create V2GchargercostEditField
            app.V2GchargercostEditField = uieditfield(app.EconomicTab, 'numeric');
            app.V2GchargercostEditField.Limits = [0 5000];
            app.V2GchargercostEditField.ValueChangedFcn = createCallbackFcn(app, @V2GchargercostEditFieldValueChanged, true);
            app.V2GchargercostEditField.FontSize = 14;
            app.V2GchargercostEditField.FontWeight = 'bold';
            app.V2GchargercostEditField.FontColor = [0.4392 0.6902 0.8706];
            app.V2GchargercostEditField.Position = [196 541 100 22];
            app.V2GchargercostEditField.Value = 900;

            % Create OwnercompenskWhkWhEditFieldLabel
            app.OwnercompenskWhkWhEditFieldLabel = uilabel(app.EconomicTab);
            app.OwnercompenskWhkWhEditFieldLabel.HorizontalAlignment = 'center';
            app.OwnercompenskWhkWhEditFieldLabel.FontSize = 14;
            app.OwnercompenskWhkWhEditFieldLabel.Position = [8 510 184 22];
            app.OwnercompenskWhkWhEditFieldLabel.Text = 'Owner compens. (kWh/kWh)';

            % Create OwnercompenskWhkWhEditField
            app.OwnercompenskWhkWhEditField = uieditfield(app.EconomicTab, 'numeric');
            app.OwnercompenskWhkWhEditField.Limits = [0 2];
            app.OwnercompenskWhkWhEditField.FontSize = 14;
            app.OwnercompenskWhkWhEditField.FontWeight = 'bold';
            app.OwnercompenskWhkWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.OwnercompenskWhkWhEditField.Position = [196 510 100 22];
            app.OwnercompenskWhkWhEditField.Value = 0.5;

            % Create LCOEkWhEditFieldLabel
            app.LCOEkWhEditFieldLabel = uilabel(app.EconomicTab);
            app.LCOEkWhEditFieldLabel.HorizontalAlignment = 'center';
            app.LCOEkWhEditFieldLabel.FontSize = 14;
            app.LCOEkWhEditFieldLabel.Position = [98 75 94 22];
            app.LCOEkWhEditFieldLabel.Text = 'LCOE ($/kWh)';

            % Create LCOEkWhEditField
            app.LCOEkWhEditField = uieditfield(app.EconomicTab, 'numeric');
            app.LCOEkWhEditField.Limits = [0.01 1];
            app.LCOEkWhEditField.FontSize = 14;
            app.LCOEkWhEditField.FontWeight = 'bold';
            app.LCOEkWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.LCOEkWhEditField.Position = [196 75 100 22];
            app.LCOEkWhEditField.Value = 0.07;

            % Create CCGTCAPEXkWEditFieldLabel
            app.CCGTCAPEXkWEditFieldLabel = uilabel(app.EconomicTab);
            app.CCGTCAPEXkWEditFieldLabel.HorizontalAlignment = 'center';
            app.CCGTCAPEXkWEditFieldLabel.FontSize = 14;
            app.CCGTCAPEXkWEditFieldLabel.Position = [55 432 137 22];
            app.CCGTCAPEXkWEditFieldLabel.Text = 'CCGT CAPEX ($/kW)';

            % Create CCGTCAPEXkWEditField
            app.CCGTCAPEXkWEditField = uieditfield(app.EconomicTab, 'numeric');
            app.CCGTCAPEXkWEditField.Limits = [100 5000];
            app.CCGTCAPEXkWEditField.FontSize = 14;
            app.CCGTCAPEXkWEditField.FontWeight = 'bold';
            app.CCGTCAPEXkWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.CCGTCAPEXkWEditField.Position = [196 432 100 22];
            app.CCGTCAPEXkWEditField.Value = 1000;

            % Create SCGTCAPEXkWEditFieldLabel
            app.SCGTCAPEXkWEditFieldLabel = uilabel(app.EconomicTab);
            app.SCGTCAPEXkWEditFieldLabel.HorizontalAlignment = 'center';
            app.SCGTCAPEXkWEditFieldLabel.FontSize = 14;
            app.SCGTCAPEXkWEditFieldLabel.Position = [56 370 136 22];
            app.SCGTCAPEXkWEditFieldLabel.Text = 'SCGT CAPEX ($/kW)';

            % Create SCGTCAPEXkWEditField
            app.SCGTCAPEXkWEditField = uieditfield(app.EconomicTab, 'numeric');
            app.SCGTCAPEXkWEditField.Limits = [100 5000];
            app.SCGTCAPEXkWEditField.FontSize = 14;
            app.SCGTCAPEXkWEditField.FontWeight = 'bold';
            app.SCGTCAPEXkWEditField.FontColor = [0.4392 0.6902 0.8706];
            app.SCGTCAPEXkWEditField.Position = [196 370 100 22];
            app.SCGTCAPEXkWEditField.Value = 800;

            % Create PeakingpremiumkWhEditFieldLabel
            app.PeakingpremiumkWhEditFieldLabel = uilabel(app.EconomicTab);
            app.PeakingpremiumkWhEditFieldLabel.HorizontalAlignment = 'center';
            app.PeakingpremiumkWhEditFieldLabel.FontSize = 14;
            app.PeakingpremiumkWhEditFieldLabel.Position = [28 308 166 22];
            app.PeakingpremiumkWhEditFieldLabel.Text = 'Peaking premium ($/kWh)';

            % Create PeakingpremiumkWhEditField
            app.PeakingpremiumkWhEditField = uieditfield(app.EconomicTab, 'numeric');
            app.PeakingpremiumkWhEditField.Limits = [0 1];
            app.PeakingpremiumkWhEditField.FontSize = 14;
            app.PeakingpremiumkWhEditField.FontWeight = 'bold';
            app.PeakingpremiumkWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.PeakingpremiumkWhEditField.Position = [196 308 100 22];
            app.PeakingpremiumkWhEditField.Value = 0.08;

            % Create BESSCAPEXkWhEditFieldLabel
            app.BESSCAPEXkWhEditFieldLabel = uilabel(app.EconomicTab);
            app.BESSCAPEXkWhEditFieldLabel.HorizontalAlignment = 'center';
            app.BESSCAPEXkWhEditFieldLabel.FontSize = 14;
            app.BESSCAPEXkWhEditFieldLabel.Position = [52 252 142 22];
            app.BESSCAPEXkWhEditFieldLabel.Text = 'BESS CAPEX ($/kWh)';

            % Create BESSCAPEXkWhEditField
            app.BESSCAPEXkWhEditField = uieditfield(app.EconomicTab, 'numeric');
            app.BESSCAPEXkWhEditField.Limits = [10 1000];
            app.BESSCAPEXkWhEditField.ValueChangedFcn = createCallbackFcn(app, @BESSCAPEXkWhEditFieldValueChanged, true);
            app.BESSCAPEXkWhEditField.FontSize = 14;
            app.BESSCAPEXkWhEditField.FontWeight = 'bold';
            app.BESSCAPEXkWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BESSCAPEXkWhEditField.Position = [196 252 100 22];
            app.BESSCAPEXkWhEditField.Value = 125;

            % Create DiscountrateEditFieldLabel
            app.DiscountrateEditFieldLabel = uilabel(app.EconomicTab);
            app.DiscountrateEditFieldLabel.HorizontalAlignment = 'center';
            app.DiscountrateEditFieldLabel.FontSize = 14;
            app.DiscountrateEditFieldLabel.Position = [78 167 114 22];
            app.DiscountrateEditFieldLabel.Text = 'Discount rate (%)';

            % Create DiscountrateEditField
            app.DiscountrateEditField = uieditfield(app.EconomicTab, 'numeric');
            app.DiscountrateEditField.Limits = [0 50];
            app.DiscountrateEditField.FontSize = 14;
            app.DiscountrateEditField.FontWeight = 'bold';
            app.DiscountrateEditField.FontColor = [0.4392 0.6902 0.8706];
            app.DiscountrateEditField.Position = [196 167 100 22];
            app.DiscountrateEditField.Value = 7;

            % Create PowerplantlifespanyearsEditFieldLabel
            app.PowerplantlifespanyearsEditFieldLabel = uilabel(app.EconomicTab);
            app.PowerplantlifespanyearsEditFieldLabel.HorizontalAlignment = 'center';
            app.PowerplantlifespanyearsEditFieldLabel.FontSize = 14;
            app.PowerplantlifespanyearsEditFieldLabel.Position = [16 136 177 22];
            app.PowerplantlifespanyearsEditFieldLabel.Text = 'Power plant lifespan (years)';

            % Create PowerplantlifespanyearsEditField
            app.PowerplantlifespanyearsEditField = uieditfield(app.EconomicTab, 'numeric');
            app.PowerplantlifespanyearsEditField.Limits = [5 100];
            app.PowerplantlifespanyearsEditField.FontSize = 14;
            app.PowerplantlifespanyearsEditField.FontWeight = 'bold';
            app.PowerplantlifespanyearsEditField.FontColor = [0.4392 0.6902 0.8706];
            app.PowerplantlifespanyearsEditField.Position = [196 136 100 22];
            app.PowerplantlifespanyearsEditField.Value = 30;

            % Create CCGTOMkWyrEditFieldLabel
            app.CCGTOMkWyrEditFieldLabel = uilabel(app.EconomicTab);
            app.CCGTOMkWyrEditFieldLabel.HorizontalAlignment = 'center';
            app.CCGTOMkWyrEditFieldLabel.FontSize = 14;
            app.CCGTOMkWyrEditFieldLabel.Position = [53 401 140 22];
            app.CCGTOMkWyrEditFieldLabel.Text = 'CCGT O&M ($/kW-yr)';

            % Create CCGTOMkWyrEditField
            app.CCGTOMkWyrEditField = uieditfield(app.EconomicTab, 'numeric');
            app.CCGTOMkWyrEditField.Limits = [0 200];
            app.CCGTOMkWyrEditField.FontSize = 14;
            app.CCGTOMkWyrEditField.FontWeight = 'bold';
            app.CCGTOMkWyrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.CCGTOMkWyrEditField.Position = [196 401 100 22];
            app.CCGTOMkWyrEditField.Value = 12.5;

            % Create SCGTOMkWyrEditFieldLabel
            app.SCGTOMkWyrEditFieldLabel = uilabel(app.EconomicTab);
            app.SCGTOMkWyrEditFieldLabel.HorizontalAlignment = 'center';
            app.SCGTOMkWyrEditFieldLabel.FontSize = 14;
            app.SCGTOMkWyrEditFieldLabel.Position = [54 339 139 22];
            app.SCGTOMkWyrEditFieldLabel.Text = 'SCGT O&M ($/kW-yr)';

            % Create SCGTOMkWyrEditField
            app.SCGTOMkWyrEditField = uieditfield(app.EconomicTab, 'numeric');
            app.SCGTOMkWyrEditField.Limits = [0 200];
            app.SCGTOMkWyrEditField.FontSize = 14;
            app.SCGTOMkWyrEditField.FontWeight = 'bold';
            app.SCGTOMkWyrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.SCGTOMkWyrEditField.Position = [196 339 100 22];
            app.SCGTOMkWyrEditField.Value = 12.5;

            % Create ChargerreplacementyrEditFieldLabel
            app.ChargerreplacementyrEditFieldLabel = uilabel(app.EconomicTab);
            app.ChargerreplacementyrEditFieldLabel.HorizontalAlignment = 'center';
            app.ChargerreplacementyrEditFieldLabel.FontSize = 14;
            app.ChargerreplacementyrEditFieldLabel.Position = [10 481 178 22];
            app.ChargerreplacementyrEditFieldLabel.Text = 'Charger replacement (%/yr)';

            % Create ChargerreplacementyrEditField
            app.ChargerreplacementyrEditField = uieditfield(app.EconomicTab, 'numeric');
            app.ChargerreplacementyrEditField.Limits = [0 100];
            app.ChargerreplacementyrEditField.FontSize = 14;
            app.ChargerreplacementyrEditField.FontWeight = 'bold';
            app.ChargerreplacementyrEditField.FontColor = [0.4392 0.6902 0.8706];
            app.ChargerreplacementyrEditField.Position = [196 481 100 22];
            app.ChargerreplacementyrEditField.Value = 5;

            % Create V2GchargerlifespanyearsEditFieldLabel
            app.V2GchargerlifespanyearsEditFieldLabel = uilabel(app.EconomicTab);
            app.V2GchargerlifespanyearsEditFieldLabel.HorizontalAlignment = 'center';
            app.V2GchargerlifespanyearsEditFieldLabel.FontSize = 14;
            app.V2GchargerlifespanyearsEditFieldLabel.Position = [14 105 180 22];
            app.V2GchargerlifespanyearsEditFieldLabel.Text = 'V2G charger lifespan (years)';

            % Create V2GchargerlifespanyearsEditField
            app.V2GchargerlifespanyearsEditField = uieditfield(app.EconomicTab, 'numeric');
            app.V2GchargerlifespanyearsEditField.Limits = [5 100];
            app.V2GchargerlifespanyearsEditField.FontSize = 14;
            app.V2GchargerlifespanyearsEditField.FontWeight = 'bold';
            app.V2GchargerlifespanyearsEditField.FontColor = [0.4392 0.6902 0.8706];
            app.V2GchargerlifespanyearsEditField.Position = [197 105 100 22];
            app.V2GchargerlifespanyearsEditField.Value = 15;

            % Create BESSOMyrkWhEditFieldLabel
            app.BESSOMyrkWhEditFieldLabel = uilabel(app.EconomicTab);
            app.BESSOMyrkWhEditFieldLabel.HorizontalAlignment = 'right';
            app.BESSOMyrkWhEditFieldLabel.FontSize = 14;
            app.BESSOMyrkWhEditFieldLabel.Position = [47 221 145 22];
            app.BESSOMyrkWhEditFieldLabel.Text = 'BESS O&M ($/yr/kWh)';

            % Create BESSOMyrkWhEditField
            app.BESSOMyrkWhEditField = uieditfield(app.EconomicTab, 'numeric');
            app.BESSOMyrkWhEditField.Limits = [0 10];
            app.BESSOMyrkWhEditField.FontSize = 14;
            app.BESSOMyrkWhEditField.FontWeight = 'bold';
            app.BESSOMyrkWhEditField.FontColor = [0.4392 0.6902 0.8706];
            app.BESSOMyrkWhEditField.Tooltip = {'Operational and maintenance costs excluding capacity augmentation due to degradation'};
            app.BESSOMyrkWhEditField.Position = [196 221 100 22];
            app.BESSOMyrkWhEditField.Value = 4;

            % Create SimulationTab
            app.SimulationTab = uitab(app.TabGroup);
            app.SimulationTab.Title = 'Simulation';

            % Create NumberofsimulateddaysEditFieldLabel
            app.NumberofsimulateddaysEditFieldLabel = uilabel(app.SimulationTab);
            app.NumberofsimulateddaysEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofsimulateddaysEditFieldLabel.FontSize = 14;
            app.NumberofsimulateddaysEditFieldLabel.Position = [11 541 170 22];
            app.NumberofsimulateddaysEditFieldLabel.Text = 'Number of simulated days';

            % Create NumberofsimulateddaysEditField
            app.NumberofsimulateddaysEditField = uieditfield(app.SimulationTab, 'numeric');
            app.NumberofsimulateddaysEditField.Limits = [7 30];
            app.NumberofsimulateddaysEditField.FontSize = 14;
            app.NumberofsimulateddaysEditField.FontWeight = 'bold';
            app.NumberofsimulateddaysEditField.FontColor = [0.4392 0.6902 0.8706];
            app.NumberofsimulateddaysEditField.Position = [196 541 100 22];
            app.NumberofsimulateddaysEditField.Value = 20;

            % Create MonthoftheyearEditFieldLabel
            app.MonthoftheyearEditFieldLabel = uilabel(app.SimulationTab);
            app.MonthoftheyearEditFieldLabel.HorizontalAlignment = 'right';
            app.MonthoftheyearEditFieldLabel.FontSize = 14;
            app.MonthoftheyearEditFieldLabel.Enable = 'off';
            app.MonthoftheyearEditFieldLabel.Position = [66 507 115 22];
            app.MonthoftheyearEditFieldLabel.Text = 'Month of the year';

            % Create MonthoftheyearEditField
            app.MonthoftheyearEditField = uieditfield(app.SimulationTab, 'numeric');
            app.MonthoftheyearEditField.Limits = [1 12];
            app.MonthoftheyearEditField.FontSize = 14;
            app.MonthoftheyearEditField.FontWeight = 'bold';
            app.MonthoftheyearEditField.FontColor = [0.4392 0.6902 0.8706];
            app.MonthoftheyearEditField.Enable = 'off';
            app.MonthoftheyearEditField.Position = [196 507 100 22];
            app.MonthoftheyearEditField.Value = 1;

            % Create EVclusteringfactorEditFieldLabel
            app.EVclusteringfactorEditFieldLabel = uilabel(app.SimulationTab);
            app.EVclusteringfactorEditFieldLabel.HorizontalAlignment = 'right';
            app.EVclusteringfactorEditFieldLabel.FontSize = 14;
            app.EVclusteringfactorEditFieldLabel.Position = [54 474 127 22];
            app.EVclusteringfactorEditFieldLabel.Text = 'EV clustering factor';

            % Create EVclusteringfactorEditField
            app.EVclusteringfactorEditField = uieditfield(app.SimulationTab, 'numeric');
            app.EVclusteringfactorEditField.Limits = [1 50];
            app.EVclusteringfactorEditField.FontSize = 14;
            app.EVclusteringfactorEditField.FontWeight = 'bold';
            app.EVclusteringfactorEditField.FontColor = [0.4392 0.6902 0.8706];
            app.EVclusteringfactorEditField.Position = [196 474 100 22];
            app.EVclusteringfactorEditField.Value = 20;

            % Create QuantifyNPVuncertaintySwitchLabel
            app.QuantifyNPVuncertaintySwitchLabel = uilabel(app.SimulationTab);
            app.QuantifyNPVuncertaintySwitchLabel.HorizontalAlignment = 'center';
            app.QuantifyNPVuncertaintySwitchLabel.FontSize = 14;
            app.QuantifyNPVuncertaintySwitchLabel.Enable = 'off';
            app.QuantifyNPVuncertaintySwitchLabel.Position = [23 356 162 22];
            app.QuantifyNPVuncertaintySwitchLabel.Text = 'Quantify NPV uncertainty';

            % Create QuantifyNPVuncertaintySwitch
            app.QuantifyNPVuncertaintySwitch = uiswitch(app.SimulationTab, 'slider');
            app.QuantifyNPVuncertaintySwitch.ValueChangedFcn = createCallbackFcn(app, @QuantifyNPVuncertaintySwitchValueChanged, true);
            app.QuantifyNPVuncertaintySwitch.Enable = 'off';
            app.QuantifyNPVuncertaintySwitch.FontSize = 14;
            app.QuantifyNPVuncertaintySwitch.Position = [224 357 45 20];
            app.QuantifyNPVuncertaintySwitch.Value = 'On';

            % Create NumberofcyclesSpinnerLabel
            app.NumberofcyclesSpinnerLabel = uilabel(app.SimulationTab);
            app.NumberofcyclesSpinnerLabel.HorizontalAlignment = 'right';
            app.NumberofcyclesSpinnerLabel.FontSize = 14;
            app.NumberofcyclesSpinnerLabel.Position = [67 322 115 22];
            app.NumberofcyclesSpinnerLabel.Text = 'Number of cycles';

            % Create NumberofcyclesSpinner
            app.NumberofcyclesSpinner = uispinner(app.SimulationTab);
            app.NumberofcyclesSpinner.Limits = [10 50];
            app.NumberofcyclesSpinner.RoundFractionalValues = 'on';
            app.NumberofcyclesSpinner.FontSize = 14;
            app.NumberofcyclesSpinner.Position = [194 321 100 22];
            app.NumberofcyclesSpinner.Value = 20;

            % Create UncertaintyquantificationLabel
            app.UncertaintyquantificationLabel = uilabel(app.SimulationTab);
            app.UncertaintyquantificationLabel.BackgroundColor = [0.149 0.149 0.149];
            app.UncertaintyquantificationLabel.HorizontalAlignment = 'center';
            app.UncertaintyquantificationLabel.FontSize = 14;
            app.UncertaintyquantificationLabel.FontWeight = 'bold';
            app.UncertaintyquantificationLabel.FontColor = [1 1 1];
            app.UncertaintyquantificationLabel.Position = [11 399 285 22];
            app.UncertaintyquantificationLabel.Text = 'Uncertainty quantification';

            % Create SettingsTab
            app.SettingsTab = uitab(app.TabGroup);
            app.SettingsTab.Title = 'Settings';

            % Create DarkthemeSwitchLabel
            app.DarkthemeSwitchLabel = uilabel(app.SettingsTab);
            app.DarkthemeSwitchLabel.HorizontalAlignment = 'center';
            app.DarkthemeSwitchLabel.FontSize = 14;
            app.DarkthemeSwitchLabel.Position = [61 531 77 22];
            app.DarkthemeSwitchLabel.Text = 'Dark theme';

            % Create DarkthemeSwitch
            app.DarkthemeSwitch = uiswitch(app.SettingsTab, 'slider');
            app.DarkthemeSwitch.ValueChangedFcn = createCallbackFcn(app, @DarkthemeSwitchValueChanged, true);
            app.DarkthemeSwitch.FontSize = 14;
            app.DarkthemeSwitch.Position = [181 532 45 20];
            app.DarkthemeSwitch.Value = 'On';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.BorderWidth = 2;
            app.RightPanel.Title = 'Simulation results and input review';
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;
            app.RightPanel.FontAngle = 'italic';
            app.RightPanel.FontSize = 16;

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.RightPanel);
            app.TabGroup2.Position = [-1 -1 702 596];

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup2);
            app.ResultsTab.Title = 'Results';

            % Create UIAxes
            app.UIAxes = uiaxes(app.ResultsTab);
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Visible = 'off';
            app.UIAxes.Position = [70 102 563 413];

            % Create PlotdataDropDownLabel
            app.PlotdataDropDownLabel = uilabel(app.ResultsTab);
            app.PlotdataDropDownLabel.HorizontalAlignment = 'right';
            app.PlotdataDropDownLabel.FontSize = 16;
            app.PlotdataDropDownLabel.Enable = 'off';
            app.PlotdataDropDownLabel.Position = [139 534 69 22];
            app.PlotdataDropDownLabel.Text = 'Plot data';

            % Create PlotdataDropDown
            app.PlotdataDropDown = uidropdown(app.ResultsTab);
            app.PlotdataDropDown.Items = {'Net-load without storage', 'Net-load with storage', 'V2G-load', 'BESS-load', 'Normalized NLV histograms', 'Load duration curve', 'EV average SOC profiles', 'BESS SOC profiles', 'V2G LCOS histogram', 'V2G consumption and discharge histograms', 'EV battery cycling data', 'SOC histogram at midnight', 'EAA seasonal', 'Equivalent annual annuity break down'};
            app.PlotdataDropDown.ValueChangedFcn = createCallbackFcn(app, @PlotdataDropDownValueChanged, true);
            app.PlotdataDropDown.Enable = 'off';
            app.PlotdataDropDown.FontSize = 16;
            app.PlotdataDropDown.Position = [223 534 351 22];
            app.PlotdataDropDown.Value = 'Net-load without storage';

            % Create RenewablepenetrationGaugeLabel
            app.RenewablepenetrationGaugeLabel = uilabel(app.ResultsTab);
            app.RenewablepenetrationGaugeLabel.HorizontalAlignment = 'center';
            app.RenewablepenetrationGaugeLabel.FontSize = 16;
            app.RenewablepenetrationGaugeLabel.Enable = 'off';
            app.RenewablepenetrationGaugeLabel.Position = [58 37 204 22];
            app.RenewablepenetrationGaugeLabel.Text = 'Renewable penetration (%):';

            % Create RenewablepenetrationGauge
            app.RenewablepenetrationGauge = uigauge(app.ResultsTab, 'linear');
            app.RenewablepenetrationGauge.Enable = 'off';
            app.RenewablepenetrationGauge.FontSize = 16;
            app.RenewablepenetrationGauge.Position = [274 25 377 46];

            % Create ReviewinputdataTab
            app.ReviewinputdataTab = uitab(app.TabGroup2);
            app.ReviewinputdataTab.Title = 'Review input data';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.ReviewinputdataTab);
            app.UIAxes_2.Box = 'on';
            app.UIAxes_2.XGrid = 'on';
            app.UIAxes_2.YGrid = 'on';
            app.UIAxes_2.Visible = 'off';
            app.UIAxes_2.Position = [70 101 563 414];

            % Create PlotinputsDropDownLabel
            app.PlotinputsDropDownLabel = uilabel(app.ReviewinputdataTab);
            app.PlotinputsDropDownLabel.HorizontalAlignment = 'right';
            app.PlotinputsDropDownLabel.FontSize = 16;
            app.PlotinputsDropDownLabel.Enable = 'off';
            app.PlotinputsDropDownLabel.Position = [127 531 81 22];
            app.PlotinputsDropDownLabel.Text = 'Plot inputs';

            % Create PlotinputsDropDown
            app.PlotinputsDropDown = uidropdown(app.ReviewinputdataTab);
            app.PlotinputsDropDown.Items = {'Load profiles', 'Solar profiles', 'Wind profiles', 'Daily variation factors', 'Plug-in probabilities', 'EV energy efficiency', 'EV travel rate PDF'};
            app.PlotinputsDropDown.ValueChangedFcn = createCallbackFcn(app, @PlotinputsDropDownValueChanged, true);
            app.PlotinputsDropDown.Enable = 'off';
            app.PlotinputsDropDown.FontSize = 16;
            app.PlotinputsDropDown.Position = [223 531 351 22];
            app.PlotinputsDropDown.Value = 'Load profiles';

            % Create SeasonButtonGroup
            app.SeasonButtonGroup = uibuttongroup(app.RightPanel);
            app.SeasonButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @SeasonButtonGroupSelectionChanged, true);
            app.SeasonButtonGroup.BorderType = 'none';
            app.SeasonButtonGroup.TitlePosition = 'centertop';
            app.SeasonButtonGroup.Title = 'Season';
            app.SeasonButtonGroup.FontAngle = 'italic';
            app.SeasonButtonGroup.Position = [1 594 696 58];

            % Create WinterButton
            app.WinterButton = uiradiobutton(app.SeasonButtonGroup);
            app.WinterButton.Text = 'Winter';
            app.WinterButton.FontWeight = 'bold';
            app.WinterButton.Position = [275 10 59 22];
            app.WinterButton.Value = true;

            % Create SummerButton
            app.SummerButton = uiradiobutton(app.SeasonButtonGroup);
            app.SummerButton.Text = 'Summer';
            app.SummerButton.FontWeight = 'bold';
            app.SummerButton.Position = [364 10 70 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = LEVIS_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end