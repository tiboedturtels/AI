function policy = CS4300_MDP_policy(S,A,P,U) 
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

%tells how many states their are
states_count = length(S);

%a vector of the policy
policy = zeros(states_count, 1);

%cycle through the states and find the optimal action for each state
for state = S
    %the greatest value that can be obtained taking an action at this state
    max_value = 0;
    %action that must be taken to achieve the max value
    max_value_action = 0;
    for action = A
        %get the chances to be at each state for a given action and state
        chances = P(state,action).probs;
        value = 0;
        %cycle through the probabilities and add them together
        for s = 1:states_count
            new_value = chances(s) * U(s);
            value = value + new_value;
        end
        if(value > max_value)
           max_value = value;
           max_value_action = action;
        end
    end
    policy(state) = max_value_action;
end