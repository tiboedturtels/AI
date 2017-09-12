% RunTest
%    Tests the CS4300_agent1 function 2000 times
%    with a maximum number of steps ranging from
%    5 - 100
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017 
%

results_step_mean = zeros(20,1);
results_step_variance = zeros(20,1);
results_step_ci_low = zeros(20,1);
results_step_ci_high = zeros(20,1);
results_gold_mean = zeros(20,1);
results_gold_ci_low = zeros(20,1);
results_gold_ci_high = zeros(20,1);

current_loop = 1;
for max_steps = 5:5:100

    steps_vector = zeros(2000, 1);
    gold_vector = zeros(2000, 1);

    for ii=1:2000

        trace = CS4300_WW2(max_steps,'CS4300_agent1');
        step = 1;


        while trace(step).agent.alive == 1 & step < (max_steps + 1)
            if trace(step).agent.x == 2 & trace(step).agent.y == 2
                gold_vector(ii) = 1;
            end
            step = step + 1;
        end

        steps_vector(ii) = step - 1;
    end

    steps_ci = paramci(fitdist(steps_vector, 'Normal'));
    gold_ci = paramci(fitdist(gold_vector, 'Normal'));
    
    results_step_mean(current_loop) = mean(steps_vector);
    results_step_variance(current_loop) = var(steps_vector);
    results_step_ci_low(current_loop) = steps_ci(1,1);
    results_step_ci_high(current_loop) = steps_ci(2,1);
    
    results_gold_mean(current_loop) = mean(gold_vector);
    results_gold_ci_low(current_loop) = gold_ci(1,1);
    results_gold_ci_high(current_loop) = gold_ci(2,1);
    
    current_loop = 1 + current_loop;
    
end


