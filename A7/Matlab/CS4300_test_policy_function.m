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

UP = 1;
LEFT = 2;
DOWN = 3;
RIGHT = 4;
REWARD = -0.04;

states = 1:11;
actions = [UP,LEFT,DOWN,RIGHT];
utility = [REWARD,REWARD,REWARD,REWARD,REWARD,REWARD,-1,REWARD,REWARD,REWARD,1];
