function new_agent = CS4300_agent_update(agent, action)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

FORWARD = 1;
RIGHT = 2;
LEFT = 3;

new_agent.x = agent.x;
new_agent.y = agent.y;
new_agent.dir = agent.dir;

if action == LEFT
    new_agent.dir = new_agent.dir + 1;
    if new_agent.dir > 3
        new_agent.dir = 0;
    end
    
elseif action == RIGHT
    new_agent.dir = new_agent.dir - 1;
    if new_agent.dir < 0
        new_agent.dir = 3;
    end
    
elseif action == FORWARD
    if new_agent.dir==0
        if new_agent.x<4
            new_agent.x = new_agent.x + 1;
        end
        
    end

    if new_agent.dir==1
        if new_agent.y<4
            new_agent.y = new_agent.y + 1;
        end
        
    end

    if new_agent.dir==2
        if new_agent.x>1
            new_agent.x = new_agent.x - 1;
        end
        
    end

    if new_agent.dir==3
        if new_agent.y>1
            new_agent.y = new_agent.y - 1;
        end
        
    end
end

