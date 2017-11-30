function [S,A,R,P,U,Ut,policy] = CS4300_run_policy_iteration(gamma,max_iter, reward)
% CS4300_run_value_iteration - runs the value iteration example in the book
% See p. 648 and p. 651 Russell & Norvig 
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
%     [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000)
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%

%this tests the board on page 464
S = 1:11;

%Board Actions 
UP = 1;
LEFT = 2;
DOWN = 3;
RIGHT = 4;
A = [UP, LEFT, DOWN, RIGHT];

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

%rewards
REWARD = reward;
R = [REWARD,REWARD,REWARD,REWARD,REWARD,REWARD,-1,REWARD,REWARD,REWARD,1];

[policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,max_iter,gamma);