function [S,A,R,P,U,Ut] = CS4300_WW_run_policy_iteration(gamma,max_iter)
% CS4300_WW_run_value_iteration - runs the value iteration for the given Wumpus
% World Problem
% On input: 
%     gamma (float): discount factor
%     max_iter (int): max number of iterations  
% On output: 
%     S (vector): states (1 to n) 
%     A (vector): actions (1 to k)
%     R (vector): state rewards 
%     P (nxk struct array): transition model 
%       (s,a).probs (a vector with n transition probabilities 
%       (from s to s_prime, given action a) 
%     U (vector): state utilities 
%     U_trace (iterxn): trace of utility values during iteration 
% Call: 
%     [S,A,R,P,U,Ut] = CS4300_WW_run_value_iteration(0.999999,1000)
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%

S = 1:16;

%Board Actions 
UP = 1;
DOWN = 2;
LEFT = 3;
RIGHT = 4;
A = [UP, DOWN, LEFT, RIGHT];
REW = -0.5;


gold = 16;
death = [3,7,11];

%Probabilities
P(16,4).probs = zeros(1,16);
num_states = length(S);
num_actions = length(A);
for state = 1 : num_states
    for action = 1 : num_actions
        P(state, action).probs = zeros(1,16);
        if state ~= gold && ~ismember(state, death)
            [target, miss_left, miss_right] = CS4300_get_possible_cells(state,action);
            P(state, action).probs(target) = P(state, action).probs(target) + 0.8;
            P(state, action).probs(miss_left) = P(state, action).probs(miss_left) + 0.1;
            P(state, action).probs(miss_right) = P(state, action).probs(miss_right) + 0.1;
        end
    end
end 

%rewards
R = ones(1,16)*REW;
for i = 1 : length(death)
    R(death(i)) = -1;
end
R(gold) = 1;

tic;
for i = 1 : 1000
    [PF, U1, Ut] = CS4300_MDP_policy_iteration(S,A,P,R,max_iter,gamma);
end
time = toc;
t = 1;
