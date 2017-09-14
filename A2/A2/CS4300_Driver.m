function drive = CS4300_Driver()
% CS4300_Driver - A* search agent example
%    Driver for the program
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

clear all;
max_steps = 50;

trace = CS4300_WW2(max_steps,'CS4300_agent_Astar_AC');
CS4300_show_trace(trace, .5);

drive = 0;
    

end