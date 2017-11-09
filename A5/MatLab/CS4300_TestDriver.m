function r = CS4300_TestDriver()
%CS4300_TestDriver - Runs the agent on 250 test boards 
% CS4300_MC_agent - Monte Carlo agent with a few informal rules 
% Call:
%     CS4300_TestDriver();
% Author:
%     Cameron Jackson and William Garnes
%     UU
%     Fall 2017
%
    load('A5_boards.mat');
    num_boards = length(boards);
    scores = [];
    successes = [];
    errored_boards = 0;
    
    for a = 1 : num_boards
        try
            clear CS4300_MC_agent;
            [scores(length(scores) + 1), t]=CS4300_WW1(50,'CS4300_MC_agent',boards(a).board);
            successes(length(successes) + 1) = t(length(t)).agent.succeed;
        catch
            errored_boards = errored_boards + 1;
        end
    end
    mean_score = mean(scores);
    var_score = var(scores);
    score_ci = paramci(fitdist(scores.', 'Normal'));
    
end

