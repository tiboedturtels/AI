function state = CS4300_Next_Agent_State( state, action )
% CS4300_Next_Agent_State
%     Returns the next state of an agent from a given action
% On input:
%     state (1x3 Integer Vector): current agent state
%      state(1) : x-coord
%      state(2) : y-coord
%      state(3) : direction (0:right, 1:up, 2:left, 3:down)
%     action (int): the action the agent will take
%      (1): FORWARD
%      (2): ROTATE_LEFT
%      (3): ROTATE_RIGHT
% 
% % Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017 
%
    if(action == 1)
        if(state(3) == 0)
            state(1) = state(1) + 1;
        elseif(state(3) == 1)
            state(2) = state(2) + 1;
        elseif(state(3) == 2)
            state(1) = state(1) - 1;
        elseif(state(3) == 3)
            state(2) = state(2) - 1;
        end
        
        if(state(1) == 5)
            state(1) = 4;
        elseif(state(1) == 0)
            state(1) = 1;
        elseif(state(2) == 5)
            state(2) = 4;
        elseif(state(2) == 0)
            state(2) = 1;
        end
    end
    if(action == 2)
        state(3) = state(3) - 1;
        if(state(3) == -1)
            state(3) = 3;
        end
    end    
    if(action == 3)
        state(3) = state(3) + 1;
        if(state(3) == 4)
            state(3) = 0;
        end
    end

end

