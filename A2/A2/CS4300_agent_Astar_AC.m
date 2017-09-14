function action = CS4300_agent_Astar_AC(percept)
% CS4300_agent_Astar_AC - A* search agent with AC
%    Uses A* to find best path back to start and AC to avoid trouble
% On input:
%     percept (1x5 Boolean vector): percept values
%      (1): Stench
%      (2): Breeze
%      (3): Glitters
%      (4): Bumped
%      (5): Screamed
% On output:
%     action (int): action selected by agent
%       FORWARD = 1;
%       ROTATE_RIGHT = 2;
%       ROTATE_LEFT = 3;
%       GRAB = 4;
%       SHOOT = 5;
%       CLIMB = 6;
% Call:
%     a = CS4300_agent_Astar_AC([0,0,0,0,0]);
% Author:
%     William Garnes and Cam Jackson
%     UU
%     Fall 2017
%

persistent state;

locations(1).x = 1; locations(1).y = 1;
locations(2).x = 2; locations(2).y = 1;
locations(3).x = 3; locations(3).y = 1;
locations(4).x = 4; locations(4).y = 1;
locations(5).x = 1; locations(5).y = 2;
locations(6).x = 2; locations(6).y = 2;
locations(7).x = 3; locations(7).y = 2;
locations(8).x = 4; locations(8).y = 2;
locations(9).x = 1; locations(9).y = 3;
locations(10).x = 2; locations(10).y = 3;
locations(11).x = 3; locations(11).y = 3;
locations(12).x = 4; locations(12).y = 3;
locations(13).x = 1; locations(13).y = 1;
locations(14).x = 2; locations(14).y = 1;
locations(15).x = 3; locations(15).y = 1;
locations(16).x = 4; locations(16).y = 1;

% set up state
if(isempty(state))
    state.Unsafe = ones(4, 4);
    state.Unsafe(4, 1) = 0;
     
    state.Graph =        [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                          1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                          0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0;
                          0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0;
                          1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0;
                          0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0;
                          0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0;
                          0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0;
                          0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0;
                          0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0;
                          0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0;
                          0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1;
                          0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0;
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0;
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1;
                          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0];
    % Set neighbor graphs here
    
    state.Domain = ones(16, 3);
    
    state.agent_state = [1, 1, 0];
    
    state.action_queue = [];
    
    state.got_gold = false;
end

action = randi(3,1);

if(percept(3) && ~state.got_gold)
    state.got_gold = true;
    state.action_queue = [];
    
    search_res = CS4300_Wumpus_A_star(state.Unsafe,state.agent_state,[1,1,0],'CS4300_Manhattan_Distance');
    state.action_queue = search_res(:, end).';
    state.action_queue = state.action_queue(:, 2:end);
    state.action_queue = [4, state.action_queue, 6];
end

if(~isempty(state.action_queue))
    action = state.action_queue(1);
    state.action_queue = state.action_queue(2:end);
    
else
    if(percept(2) == 0)
        index = 1;
       for i = state.Graph(state.agent_state(2) + (4 * state.agent_state(1) - 4),:)
            if(i == 1)
                state.Domain(index, 2) = 0;
            end
            index = index + 1;
       end
    end
    state.Domain = CS4300_AC3(state.Graph, state.Domain, 'CS4300_Wumpus_Constraint');
    for i = 1:size(state.Domain, 1)
        l = locations(i);
        x = l.x;
        y = l.y;
        if(~state.Domain(i, 2) && state.Unsafe(x, y))
            state.Unsafe(5 - y, x) = 0;
            search_res = CS4300_Wumpus_A_star(state.Unsafe,state.agent_state,[x,y,0],'CS4300_Manhattan_Distance');
            state.action_queue = search_res(:, end).';
            state.action_queue = state.action_queue(:, 2:end);
            action = state.action_queue(1);
            state.action_queue = state.action_queue(2:end);
            return
            
        end
    end   
end
    

state.agent_state = CS4300_Next_Agent_State(state.agent_state, action);
%state.Unsafe(state.agent_state(1), state.agent_state(2)) = 0;

end
    