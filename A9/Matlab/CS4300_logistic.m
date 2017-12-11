function logis = CS4300_logistic(w, x)

logis = 0;

first_value = w(1);
other_values = w(1,2:end);

total_value = dot(x,other_values) + first_value;

logis = 1 / (1+exp(-1 * total_value));