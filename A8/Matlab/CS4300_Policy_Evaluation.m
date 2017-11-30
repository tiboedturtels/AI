function U_new = CS4300_Policy_Evaluation(policy,U,S,P,R,gamma,k)
% CS4300_Policy_Evaluation - policy evaluation 
%
% On input:
%       policy (vector): policy for problem (1 to n) 
%       U (vector): current utilities (1 to n)
%       S (vector): states (1 to n) 
%       P (nxk array): transition model 
%       gamma (float): discount factor 
%       k (int): number of iterations 
% On output: 
%       U_new (nx1 vector): final utilities found 
% Call: 
%       U_new = CS4300_Policy_Evaluation(policy,U,S,P,R,gamma,k) 
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%

U_new = zeros(1,length(S));

for loopCount = 1:k
    for state = S
        value = 0;
        for newState = S
            value = value + ...
                (P(state,policy(state)).probs(newState) * U(newState));
        end
        utilityValue = R(state) + (gamma * value);
        U_new(state) = utilityValue;
    end
    U = U_new;
end