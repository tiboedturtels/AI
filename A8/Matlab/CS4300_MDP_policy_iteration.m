function [policy,U,Ut] = CS4300_MDP_policy_iteration(S,A,P,R,k,gamma)
% CS4300_MDP_policy_iteration - policy iteration 
% Chapter 17 Russell and Norvig (Table p. 657) 
% On input: 
%       S (vector): states (1 to n) 
%       A (vector): actions (1 to k) 
%       P (nxk array): transition model 
%       R (vector): state rewards 
%       k (int): number of iterations 
%       gamma (float): discount factor 
% On output: 
%       policy (nx1 vector): policy for problem 
%       U (nx1 vector): final utilities found 
%       Ut (num_iter by n array): trace of utilities (each is U at that step) 
% Call: 
% 
%       Layout:             1 
%                           ˆ 
%       9 10 11 12          | 
%       5  6  7  8      2 <- -> 4 
%       1  2  3  4          | 
%                           V 
%                           3 
%       [S,A,R,P,U,Ut] = CS4300_run_value_iteration(0.999999,1000); 
%       [p,Up,Tpt] = CS4300_MDP_policy_iteration(S,A,P,R,10,0.999) 
%       p’ 
% 
% p = 
%
%       1       corrresponds to: 
%       2 
%       2               -> -> -> X 
%       2               ˆ  X   ˆ X 
%       1               ˆ  <- <- <
%       1 
%       1 
%       1 
%       4 
%       4 
%       4 
%       1 
% 
% Author: 
%       William Garnes and Cameron Jackson
%       UU 
%       Fall 2017 
%

%tells how many states there are
statesCount = length(S);

%creates utility and fills it with zeros
U = zeros(1, statesCount);

%vector to hold all of the utilities that are created
Ut = [];

%creates policy and fills it with a random action
policy = zeros(1, statesCount);
for index = S
    policy(index) = randi(4,1);
end

%tells if the policy has changed
unchanged = false;

index = 1;
while ~unchanged
    Ut(index).trace = U;
    U = CS4300_Policy_Evaluation(policy,U,S,P,R,gamma,k);
    utilityPolicy = CS4300_MDP_policy(S,A,P,U);
    
    unchanged = true;
    for state = S
        utilityPolicyValue = 0;
        policyValue = 0;
        
        for newState = S
            utilityPolicyValue = utilityPolicyValue + ...
                (P(state,utilityPolicy(state)).probs(newState) ...
                * U(newState));
            
            policyValue = policyValue + ...
                (P(state,policy(state)).probs(newState) * U(newState));
        end
        
        if(utilityPolicyValue > policyValue)
            policy(state) = utilityPolicy(state);
            unchanged = false;
        end
    end
    
    index = index + 1;
end
