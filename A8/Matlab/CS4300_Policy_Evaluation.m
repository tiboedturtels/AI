function U_new = CS4300_Policy_Evaluation(policy,U,S,P,R,gamma,k)

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