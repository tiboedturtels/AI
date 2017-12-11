function thres = CS4300_threshold(w, x)

thres = 0;

first_value = w(1);
other_values = w(1,2:end);

total_value = dot(x,other_values) + first_value;

if(total_value >= 0)
    thres = 1;
end