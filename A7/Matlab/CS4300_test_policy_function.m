function policy = CS4300_test_policy_function
% CS4300_MDP_policy - generate a policy from utilities 
% See p. 648 Russell & Norvig 
% On input: 
% S (vector): states (1 to n) 
% A (vector): actions (1 to k) 
% P (nxk struct array): transition model 
% (s,a).probs (a vector with n transition probabilities 
% from s to s_prime, given action a) 
% U (vector): state utilities 
% On output: 
% policy (vector): actions per state 
% Call: 
% p = CS4300_MDP_policy(S,A,P,U); 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

% UP = 1;
% LEFT = 2;
% DOWN = 3;
% RIGHT = 4;
% REWARD = -0.04;
% 
% states = 1:11;
% actions = [UP,LEFT,DOWN,RIGHT];
% utility = [REWARD,REWARD,REWARD,REWARD,REWARD,REWARD,-1,REWARD,REWARD,REWARD,1];

LEFT = 1;
RIGHT = 2;
S = 1:3;
A = [LEFT, RIGHT];

P(1,LEFT).probs = [1, 0, 0];
P(1,RIGHT).probs = [0, 1, 0];
P(2,LEFT).probs = [1, 0, 0];
P(2,RIGHT).probs = [0, 0, 1];
P(3,LEFT).probs = [0, 1, 0];
P(3,RIGHT).probs = [0, 0, 1];

R = [-.5, -.5, 1];

gamma = .99999;
eta = .01;
max_iter = 1000;

[U, U_trace] = CS4300_MDP_value_iteration(S,A,P,R,gamma,eta,max_iter);
policy = CS4300_MDP_policy(S,A,P,U);

U
policy
