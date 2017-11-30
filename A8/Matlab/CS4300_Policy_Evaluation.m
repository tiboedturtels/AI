function U_new = CS4300_Policy_Evaluation(policy,U,S,P,R,gamma)

U_new = zeros(1,length(S));

for state = S
    value = 0;
    for newState = S
        action = policy(state);
        chances = P(state,action).probs;
        
        value = value + (chances(newState) * U(newState));
    end
    utilityValue = R(state) + (gamma * value);
    U_new(state) = utilityValue;
end