function new_agent = CS4300_agent_update(agent, action)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
new_agent.x = agent.x;
new_agent.y = agent.y;
new_agent.dir = agent.dir;

if action == 2
    new_agent.dir = new_agent.dir + 1;
    if new_agent.dir > 3
        new_agent.dir = 0;
    end
    
elseif action == 3
    new_agent.dir = new_agent.dir - 1;
    if new_agent.dir < 0
        new_agent.dir = 3;
    end
    
elseif action == 1
    if new_agent.dir==0
        if x<4
            new_agent.x = x + 1;
        end
        return
    end

    if new_agent.dir==1
        if y<4
            new_agent.y = y + 1;
        end
        return
    end

    if new_agent.dir==2
        if x>1
            new_agent.x = x - 1;
        end
        return
    end

    if new_agent.dir==3
        if y>1
            new_agent.y = y - 1;
        end
        return
    end
end

