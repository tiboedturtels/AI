function drive = CS4300_Test_Driver()
% CS4300_Driver - A* Test Driver
%    Driver for the program
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

clear all;
max_steps = 50;

Astar_means = [0, 0, 0];
AC3_means = [0, 0, 0];

Board1 = [0,0,0,0; 0,0,0,0; 0,2,0,0; 0,0,0,0];
Board2 = [1,0,0,2; 0,0,0,0; 0,0,0,0; 0,0,0,1];
Board3 = [0,0,0,0; 0,0,0,0; 0,0,0,0; 0,0,1,2];


num_trials = 500;

% ---------- Astar Tests ---------- %

success_Astar_1 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar', Board1);
    %CS4300_show_trace(trace, 0.1);
    success_Astar_1(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar;
end
Astar_means(1) = mean(success_Astar_1);
Astar_ci_1 = paramci(fitdist(success_Astar_1.', 'Normal'));
Astar_ci_1 = Astar_ci_1(:,1);

success_Astar_2 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar', Board2);
    %CS4300_show_trace(trace, 0.1);
    success_Astar_2(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar;
end
Astar_means(2) = mean(success_Astar_2);  
    

success_Astar_3 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar', Board3);
    %CS4300_show_trace(trace, 0.1);
    success_Astar_3(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar;
end
Astar_means(3) = mean(success_Astar_3);




% ---------- AC3 Tests ---------- %
success_AC3_1 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar_AC', Board1);
    %CS4300_show_trace(trace, 0.1);
    success_AC3_1(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar_AC;
end
AC3_means(1) = mean(success_AC3_1);


success_AC3_2 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar_AC', Board2);
    %CS4300_show_trace(trace, 0.1);
    success_AC3_2(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar_AC;
end
AC3_means(2) = mean(success_AC3_2);
    

success_AC3_3 = zeros(1, num_trials);
for i = 1 : num_trials
    trace = CS4300_WW1(max_steps,'CS4300_agent_Astar_AC', Board3);
    %CS4300_show_trace(trace, 0.1);
    success_AC3_3(i) = trace(end).agent.succeed;
    clear CS4300_agent_Astar_AC;
end
AC3_means(3) = mean(success_AC3_3);


Astar_ci_1 = paramci(fitdist(success_Astar_1.', 'Normal'));
Astar_ci_1 = Astar_ci_1(:,1);
Astar_ci_2 = paramci(fitdist(success_Astar_2.', 'Normal'));
Astar_ci_2 = Astar_ci_2(:,1);
Astar_ci_3 = paramci(fitdist(success_Astar_3.', 'Normal'));
Astar_ci_3 = Astar_ci_3(:,1);

AC3_ci_1 = paramci(fitdist(success_AC3_1.', 'Normal'));
AC3_ci_1 = AC3_ci_1(:,1);
AC3_ci_2 = paramci(fitdist(success_AC3_2.', 'Normal'));
AC3_ci_2 = AC3_ci_2(:,1);
AC3_ci_3 = paramci(fitdist(success_AC3_3.', 'Normal'));
AC3_ci_3 = AC3_ci_3(:,1);

% bar([Astar_means; AC3_means]);
% title('Average Success Rate');
% ylabel('Fraction');
% xlabel('Algorithm');

a = 5;

end
