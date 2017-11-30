function [target, miss_left, miss_right] = CS4300_get_possible_cells(state, action)
% CS4300_get_possible_cells - Helper function which gets an array of states
% that could result from a given state and action
% On input: 
%     state (Integer): current state
%     action (Integer): currently selected action
% On output: 
%     target (Integer): the state the agent is facing toward
%     miss_left (Integer): the state to the agent's left
%     miss_right (Integer): the state to the agent's right
% Call: 
%     [t, l, r] = CS4300_get_possible_cells(2, 1);
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%
    UP = 1;
    DOWN = 2;
    LEFT = 3;
    RIGHT = 4;
    
    ROW_UP = 4;
    ROW_DOWN = -4;
    COL_UP = 1;
    COL_DOWN = -1;
    
    x = mod(state - 1, 4) + 1;
    y = fix((state-1)/4) + 1;
    
    target = state;
    miss_left = state;
    miss_right = state;
    
    if action == UP
        if y < 4
            target = state + ROW_UP;
        end
        if x > 1
            miss_left = state + COL_DOWN;
        end
        if x < 4
            miss_right = state + COL_UP;
        end
        
    elseif action == DOWN
        if y > 1
            target = state + ROW_DOWN;
        end
        if x < 4
            miss_left = state + COL_UP;
        end
        if x > 1
            miss_right = state + COL_DOWN;
        end
    
    elseif action == LEFT
        if x > 1
            target = state + COL_DOWN;
        end
        if y > 1
            miss_left = state + ROW_DOWN;
        end
        if y < 4
            miss_right = state + ROW_UP;
        end
    
    elseif action == RIGHT
        if x < 4
            target = state + COL_UP;
        end
        if y < 4
            miss_left = state + ROW_UP;
        end
        if y > 1
            miss_right = state + ROW_DOWN;
        end
        
    end
end

