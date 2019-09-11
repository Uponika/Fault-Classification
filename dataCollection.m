function [] = dataCollection(model)

for faultType = 1:1:11
    switch faultType
        case 1
            set_param([model '/faultBlock'], 'FaultA', 'on');
            fault = 'AG';
        case 2
            set_param([model '/faultBlock'], 'FaultB', 'on');
            set_param([model '/faultBlock'], 'FaultA', 'off');
            fault = 'BG';
        case 3
            set_param([model '/faultBlock'], 'FaultC', 'on');
            set_param([model '/faultBlock'], 'FaultB', 'off');
            fault = 'CG';
        case 4
            set_param([model '/faultBlock'], 'FaultA', 'on', 'FaultB', 'on');
            set_param([model '/faultBlock'], 'FaultC', 'off');
            fault = 'AB';
        case 5
            set_param([model '/faultBlock'], 'FaultA', 'on', 'FaultC', 'on' );
            set_param([model '/faultBlock'], 'FaultB', 'off');
            fault = 'AC';
        case 6
            set_param([model '/faultBlock'], 'FaultB', 'on', 'FaultC', 'on');
            set_param([model '/faultBlock'], 'FaultA', 'off');
            fault = 'BC';
        case 7
            set_param([model '/faultBlock'], 'FaultA', 'on', 'FaultB', 'on', 'GroundFault', 'on');
            set_param([model '/faultBlock'], 'FaultC', 'off');
            fault = 'ABG';
        case 8
            set_param([model '/faultBlock'], 'FaultB', 'on', 'FaultC', 'on', 'GroundFault', 'on' );
            set_param([model '/faultBlock'], 'FaultA', 'off');
            fault = 'BCG';
        case 9
            set_param([model '/faultBlock'], 'FaultA' , 'on', 'FaultC', 'on', 'GroundFault', 'on');
            set_param([model '/faultBlock'], 'FaultB', 'off');
            fault = 'ACG';
        case 10
            set_param([model '/faultBlock'], 'FaultA' , 'on', 'FaultB', 'on', 'FaultC', 'on');
            set_param([model '/faultBlock'], 'GroundFault', 'off' );
            fault = 'ABC';
        case 11
            set_param([model '/faultBlock'], 'FaultA' , 'on', 'FaultB', 'on', 'FaultC', 'on', 'GroundFault', 'on');
            fault = 'ABCG';
    end
    for LineLength = 0.01:10:100
        set_param([model '/Line1'], 'Length', num2str(LineLength));
        set_param([model '/LineLen'], 'Value', num2str(LineLength));
        sim(model)
        assignin('base',[num2str(fault) '_' num2str(floor(LineLength))],data)
    end
end



