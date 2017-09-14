function state = CS4300_Next_Agent_State( state, action )
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

