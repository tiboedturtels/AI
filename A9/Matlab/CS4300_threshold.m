function thres = CS4300_threshold(w, x)
% CS4300_threshold 
% On input:
%       w ((n+1)x1 vector): weights for linear function 
%       x (nx1 array): n independent variable samples each of length m 
% On output: 
%       thres : value of the threshold for w * x
% Call: 
%       logis = CS4300_logistic(w, x); 
% Author: 
%       William Garnes and Cameron Jackson 
%       UU 
%       Fall 2017 
%

thres = 0;

first_value = w(1);
other_values = w(1,2:end);

total_value = dot(x,other_values) + first_value;

if(total_value >= 0)
    thres = 1;
end