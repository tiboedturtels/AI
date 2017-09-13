function drive = CS4300_Driver()
max_steps = 500;



trace = CS4300_WW2(max_steps,'CS4300_agent_Astar');
CS4300_show_trace(trace, .5);

drive = 0;
    

end
