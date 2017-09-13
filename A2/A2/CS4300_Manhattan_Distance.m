function distance = CS4300_Manhattan_Distance(state,goal_state)
distance = abs(state(1) - goal_state(1)) + abs(state(2) - goal_state(2));