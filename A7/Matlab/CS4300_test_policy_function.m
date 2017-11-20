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

%this tests the board on page 464
S = 1:11;

%Board Actions 
UP = 1;
DOWN = 2;
LEFT = 3;
RIGHT = 4;
A = [UP, DOWN, LEFT, RIGHT];

%probabilities
P(1,UP).probs = [.1,.1,0,0,.8,0,0,0,0,0,0];
P(1,DOWN).probs = [.9,.1,0,0,0,0,0,0,0,0,0];
P(1,LEFT).probs = [.9,0,0,0,.1,0,0,0,0,0,0];
P(1,RIGHT).probs = [.1,.8,0,0,.1,0,0,0,0,0,0];

P(2,UP).probs = [.1,.8,.1,0,0,0,0,0,0,0,0];
P(2,DOWN).probs = [.1,.8,.1,0,0,0,0,0,0,0,0];
P(2,LEFT).probs = [.8,.2,0,0,0,0,0,0,0,0,0];
P(2,RIGHT).probs = [0,.2,.8,0,0,0,0,0,0,0,0];

P(3,UP).probs = [0,.1,0,.1,0,.8,0,0,0,0,0];
P(3,DOWN).probs = [0,.1,.8,.1,0,0,0,0,0,0,0];
P(3,LEFT).probs = [0,.8,.1,0,0,.1,0,0,0,0,0];
P(3,RIGHT).probs = [0,0,.1,.8,0,.1,0,0,0,0,0];

P(4,UP).probs = [0,0,.1,.1,0,0,.8,0,0,0,0];
P(4,DOWN).probs = [0,0,.1,.9,0,0,0,0,0,0,0];
P(4,LEFT).probs = [0,0,.8,.1,0,0,.1,0,0,0,0];
P(4,RIGHT).probs = [0,0,0,.9,0,0,.1,0,0,0,0];

P(5,UP).probs = [0,0,0,0,.2,0,0,.8,0,0,0];
P(5,DOWN).probs = [.8,0,0,0,.2,0,0,0,0,0,0];
P(5,LEFT).probs = [.1,0,0,0,.8,0,0,.1,0,0,0];
P(5,RIGHT).probs = [.1,0,0,0,.8,0,0,.1,0,0,0];

P(6,UP).probs = [0,0,0,0,0,.1,.1,0,0,.8,0];
P(6,DOWN).probs = [0,0,.8,0,0,.1,.1,0,0,0,0];
P(6,LEFT).probs = [0,0,.1,0,0,.8,0,0,0,.1,0];
P(6,RIGHT).probs = [0,0,.1,0,0,0,.8,0,0,.1,0];

% P(7,UP).probs = [0,0,0,0,0,.1,.1,0,0,0,.8];
% P(7,DOWN).probs = [0,0,0,.8,0,.1,.1,0,0,0,0];
% P(7,LEFT).probs = [0,0,0,.1,0,.8,0,0,0,0,.1];
% P(7,RIGHT).probs = [0,0,0,.1,0,0,.8,0,0,0,.1];

P(7,UP).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(7,DOWN).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(7,LEFT).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(7,RIGHT).probs = [0,0,0,0,0,0,0,0,0,0,0];

P(8,UP).probs = [0,0,0,0,0,0,0,.9,.1,0,0];
P(8,DOWN).probs = [0,0,0,0,.8,0,0,.1,.1,0,0];
P(8,LEFT).probs = [0,0,0,0,.1,0,0,.9,0,0,0];
P(8,RIGHT).probs = [0,0,0,0,.1,0,0,.1,.8,0,0];

P(9,UP).probs = [0,0,0,0,0,0,0,.1,.8,.1,0];
P(9,DOWN).probs = [0,0,0,0,0,0,0,.1,.8,.1,0];
P(9,LEFT).probs = [0,0,0,0,0,0,0,.8,.2,0,0];
P(9,RIGHT).probs = [0,0,0,0,0,0,0,0,.2,.8,0];

P(10,UP).probs = [0,0,0,0,0,0,0,0,.1,.8,.1];
P(10,DOWN).probs = [0,0,0,0,0,.8,0,0,.1,0,.1];
P(10,LEFT).probs = [0,0,0,0,0,.1,0,0,.8,.1,0];
P(10,RIGHT).probs = [0,0,0,0,0,.1,0,0,0,.1,.8];

% P(11,UP).probs = [0,0,0,0,0,0,0,0,0,.1,.9];
% P(11,DOWN).probs = [0,0,0,0,0,0,.8,0,0,.1,.1];
% P(11,LEFT).probs = [0,0,0,0,0,0,.1,0,0,.8,.1];
% P(11,RIGHT).probs = [0,0,0,0,0,0,.1,0,0,0,.9];

P(11,UP).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(11,DOWN).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(11,LEFT).probs = [0,0,0,0,0,0,0,0,0,0,0];
P(11,RIGHT).probs = [0,0,0,0,0,0,0,0,0,0,0];


REWARD = -2.0;
R = [REWARD,REWARD,REWARD,REWARD,REWARD,REWARD,-1,REWARD,REWARD,REWARD,1];

gamma = 0.999999;
eta = .1;
max_iter = 100;

[U, U_trace] = CS4300_MDP_value_iteration(S,A,P,R,gamma,eta,max_iter);
policy = CS4300_MDP_policy(S,A,P,U);

U
policy