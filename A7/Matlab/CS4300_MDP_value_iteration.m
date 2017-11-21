function [U,U_trace] = CS4300_MDP_value_iteration(S,A,P,R,gamma,... 
    eta,max_iter) 
% CS4300_MDP_value_iteration - compute policy using value iteration 
% On input: 
%   S (vector): states (1 to n) 
%   A (vector): actions (1 to k) 
%   P (nxk struct array): transition model 
%       (s,a).probs (a vector with n transition probabilities 
%       (from s to s_prime, given action a) 
%   R (vector): state rewards 
%   gamma (float): discount factor 
%   eta (float): termination threshold 
%   max_iter (int): max number of iterations 
% On output: 
%   U (vector): state utilities 
%   U_trace (iterxn): trace of utility values during iteration 
% Call: 
%   [U,Ut] = Cs4300_MDP_value_iteration(S,A,P,R,0.999999,0.1,100); 
% 
%   Set up a driver function, CS_4300_run_value_iteration (see 
%   below), which sets up the Markov Decision Problem and calls this 
%   function. 
% 
%   Chapter 17 Russell and Norvig (Table p. 651) 
%   [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000) 
% 
%   U’ = 0.7053 0.6553 0.6114 0.3879 0.7616 0 0.6600 -1.0000 
%       0.8116 0.8678 0.9178 1.0000
% 
% Layout:           1 
%                   ˆ 
% 9 10 11 12        | 
% 5  6  7  8    2 <- -> 4 
% 1  2  3  4        | 
%                   V 
%                   3 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

state_count = length(S);
iter = 1;
U = zeros(1, state_count);
U_trace = [];

%loop unil the maximum loops is hit
while(iter <= max_iter)
    
    %place the current U into the trace
    U_trace(iter).trace = U;
    past_U = U;
    %set the delta back to 0
    delta = 0;
    
    %loop through each state
    for state = S
        max_value = -10000;
        %loop through the actions for each state
        for action = A
            probs = P(state,action).probs;
            
            value = 0;
            for index = 1:state_count
               value = past_U(index) * probs(index) + value;
            end
            if value > max_value
                max_value = value;
            end
        end
        U(state) = max_value * gamma + R(state);
        if abs(U(state) - past_U(state)) > delta
           delta =  abs(U(state) - past_U(state));
        end
    end
    
    iter = iter + 1;
    if(delta < (eta*(1 - gamma) / gamma))
        break
    end
end

U_trace(iter).trace = U;