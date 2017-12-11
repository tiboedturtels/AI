function [w,per_cor] = ... 
    CS4300_perceptron_learning(X,y,alpha,max_iter,rate) 
% CS4300_perceptron_learning - find linear separating hyperplane 
% Eqn 18.7, p. 724 Russell and Norvig 
% On input: 
% X (nxm array): n independent variable samples each of length m 
% y (nx1 vector): dependent variable samples 
% alpha (float): learning rate 
% max_iter (int): max number of iterations 
% rate (Boolean): if 1 then alpha = 1000/(1000+iter), else 
% constant 
% On output: 
% w ((m+1)x1 vector): weights for linear function 
% per_cor (kx1 array): trace of percentage correct with weight 
% Call: 
% [w,pc] = CS4300_perceptron_learning(X,y,0.1,10000,1); 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

%the number of rows and columns
[row_count,col_count] = size(X);


%vector of the weights
w = zeros(1, 1 + col_count);

%length of the weight vector
w_count = length(w);

%how many are correct for each loop
per_cor = [];

for iter =  1:max_iter
    if(rate == 1)
       alpha = 1000/(1000+iter); 
    end
    
    %how many errors there are this loop
    error_count = 0;
    
    %loop through each of the rows
    for row = 1:row_count
        %get the y value at the row
        y_value = y(row);
        %get all of the x values at the row
        x_values = X(row,1:col_count);
        %get a new weight value
        new_value = alpha * (y_value - CS4300_threshold(w,x_values));
        
        %update the weights
        for w_index = 2:w_count
           w(w_index) = w(w_index) + (new_value * x_values(w_index - 1)); 
        end
        w(1) = w(1) + new_value;
        
        if(new_value ~= 0)
           error_count = error_count + 1; 
        end
    end
    
    correct_percent = 1 - (error_count / row_count);
    per_cor = [per_cor,correct_percent];
    
    if(correct_percent == 1)
       return 
    end
end
