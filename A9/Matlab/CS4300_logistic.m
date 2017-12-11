function logis = CS4300_logistic(w, x)
% CS4300_logistic 
% On input:
%       w ((n+1)x1 vector): weights for linear function 
%       x (nx1 array): n independent variable samples each of length m 
% On output: 
%       logis : value of the logistics for w * x
% Call: 
%       logis = CS4300_logistic(w, x); 
% Author: 
%       William Garnes and Cameron Jackson 
%       UU 
%       Fall 2017 
%

first_value = w(1);
other_values = w(1,2:end);

total_value = dot(x,other_values) + first_value;

logis = 1 / (1+exp(-1 * total_value));