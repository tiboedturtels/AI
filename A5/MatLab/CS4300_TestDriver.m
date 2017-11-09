function r = CS4300_TestDriver()
%CS4300_TestDriver Summary of this function goes here
%   Detailed explanation goes here
    %[scores(1), t]=CS4300_WW1(50,'CS4300_MC_agent',[2,3,1,0; 0,1,0,0; 0,0,0,0; 0,0,0,0]);
    
    
    load('A5_boards.mat');
    num_boards = length(boards);
    scores = [];
    successes = [];
    errored_boards = 0;
    
    for a = 1 : num_boards
        try
            disp(a);
            clear CS4300_agent_Astar_AC;
            [scores(length(scores) + 1), t]=CS4300_WW1(50,'CS4300_agent_Astar_AC',boards(a).board);
            successes(length(successes) + 1) = t(length(t)).agent.succeed;
        catch
            errored_boards = errored_boards + 1;
        end
    end
    success_count = 0;
    for i = successes
       if i == 1
            success_count = success_count + 1;
       end
    end
    
    mean_score = mean(scores);
    var_score = var(scores);
    score_ci = paramci(fitdist(scores.', 'Normal'));

    hi = 5;
    
end

