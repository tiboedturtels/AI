function drive = CS4300_Test_Driver()
% CS4300_Driver - A* Test Driver
%    Driver for the program
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

clear all;
max_steps = 100;

success_1 = zeros(1, 2000);
Board1 = [0,0,0,0; 0,0,0,0; 0,2,0,0; 0,0,0,0];
for i = 1 : 2000
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar', Board1);
    %CS4300_show_trace(trace, 0.1);
    success_1(i) = trace(end).agent.succeed;
    clear functions;
end
mean_1 = mean(success_1);

    
    

end
