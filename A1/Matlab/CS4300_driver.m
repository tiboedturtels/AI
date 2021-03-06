max_steps = 50;

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

results_step_mean = mean(steps_vector)
results_step_variance = var(steps_vector)
results_step_ci_low = steps_ci(1,1)
results_step_ci_high = steps_ci(2,1)

results_gold_mean = mean(gold_vector)
results_gold_ci_low = gold_ci(1,1)
results_gold_ci_high = gold_ci(2,1)
