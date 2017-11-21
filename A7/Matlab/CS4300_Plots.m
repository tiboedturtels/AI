function f = CS4300_Plots()
% CS4300_run_value_iteration - generates utility estimate plots for the given Wumpus
% World Problem
% On input: 
%   gamma (float): discount factor
%   max_iter (int): max number of iterations  
% On output: 
%   S (vector): states (1 to n) 
%   A (vector): actions (1 to k)
%   R (vector): state rewards 
%   P (nxk struct array): transition model 
%       (s,a).probs (a vector with n transition probabilities 
%       (from s to s_prime, given action a) 
%   U (vector): state utilities 
%   U_trace (iterxn): trace of utility values during iteration 
% Call: 
%   [S,A,R,P,U,Ut] = CS4300_WW_run_value_iteration(0.999999,1000)
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

gamma = 0.999999;

iterations = [];

utilities11 = [];
utilities34 = [];
utilities44 = [];

for max_iter = 0 : 30
    [S,A,R,P,U,Ut] = CS4300_WW_run_value_iteration(gamma, max_iter);
    
    iterations(length(iterations) + 1) = max_iter;
    utilities11(length(utilities11) + 1) = U(1);
    utilities34(length(utilities34) + 1) = U(15);
    utilities44(length(utilities44) + 1) = U(16);
end

plot(iterations, utilities11, '--', iterations, utilities34, '-.', iterations, utilities44);
legend('(1,1)','(3,4)','(4,4)');
ylabel('Utility Estimates');
xlabel('Number of Iterations');
title('Utility Changes (gamma = 0.999999)');