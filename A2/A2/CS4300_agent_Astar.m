function action = CS4300_agent_Astar(percept)
% CS4300_agent_Astar - A* search agent example
%    Uses A* to find best path back to start
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
%     a = CS4300_agent_Astar([0,0,0,0,0]);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

FORWARD = 1;
ROTATE_RIGHT = 2;
ROTATE_LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

persistent state;
persistent got_gold;
persistent unsafe_cells;
persistent action_queue;

if isempty(state)
    state = [1, 1, 0];
    got_gold = 0;
    unsafe_cells = ones(4,4);
    unsafe_cells(4,1) = 0;
end

if(percept(3) == 1 && got_gold == 0)
    got_gold = 1;
    search_tree = CS4300_Wumpus_BFS(unsafe_cells, state, [1, 1, 0]);
    %action_queue = zeros(length+1);
    %action_queue(1) = 4;
    action_queue = search_tree(:, end).';
    action_queue = action_queue(:, 2:end);
    action_queue = [4, action_queue, 6];
   % for index = 2:length
    %    action_queue(index) = search_tree(index,
    %end
end

action = 0;
if(got_gold == 0)
    action = randi(3,1);
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
    
    unsafe_cells(5 - state(2), state(1)) = 0;
else 
    action = action_queue(1);
    action_queue = action_queue(2:end);
end


end