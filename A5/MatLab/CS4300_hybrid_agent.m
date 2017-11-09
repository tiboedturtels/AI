function action = CS4300_hybrid_agent(percept) 
% CS4300_hybrid_agent - hybrid random and logic-based agent
% On input: 
%     percept( 1x5 Boolean vector): percepts 
% On output: 
%     action (int): action selected by agent 
% Call: 
%     a = CS4300_hybrid_agent([0,0,0,0,0]); 
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%

persistent t plan board agent safe visited have_gold pits Wumpus KB KBi vars

if isempty(t)
    t = 0;
    plan = [];
    board = [-1,-1,-1,-1; -1,-1,-1,-1;-1,-1,-1,-1;0,-1,-1,-1];
    pits = -ones(4,4);
    pits(4,1) = 0;
    Wumpus = -ones(4,4);
    Wumpus(4,1) = 0;
    agent.x = 1;
    agent.y = 1;
    agent.dir = 0;
    visited = zeros(4,4);
    visited(4,1) = 1;
    safe = zeros(4,4);
    safe(4,1) = 1;
    have_gold = 0;
    [KB, KBi, vars] = CS4300_gen_KB;
end

MINUS = '-';

FORWARD = 1;
RIGHT = 2;
LEFT = 3;
GRAB = 4;
SHOOT = 5;
CLIMB = 6;

percept_sentence = CS4300_make_percept_sentence(percept, agent.x, agent.y);
KBi = CS4300_Tell(KBi, percept_sentence);

neighbors = CS4300_Wumpus_neighbors(agent.x,agent.y);
num_neighbors = length(neighbors(:,1));
for n = 1:num_neighbors
    n_x = neighbors(n,1);
    n_y = neighbors(n,2);
    row = 4-n_y+1;
    col = n_x;

    %If we don't know if there is a Wumpus
    if Wumpus(row, col) == -1
        pos_sentence.clauses = CS4300_get_var_index('W', n_x, n_y);
        neg_sentence.clauses = -pos_sentence.clauses;
        % If Wumpus here
        if CS4300_Ask(KBi, pos_sentence)
            Wumpus(row, col) = 1;
            pits(row, col) = 0;
        % If no Wumpus here
        elseif CS4300_Ask(KBi, neg_sentence)
            Wumpus(row, col) = 0;
        end
    end
    
    %If we don't know if there is a pit
    if pits(row, col) == -1
        pos_sentence.clauses = CS4300_get_var_index('P', n_x, n_y);
        neg_sentence.clauses = -pos_sentence.clauses;
        % If pit here
        if CS4300_Ask(KBi, pos_sentence)
            pits(row, col) = 1;
            Wumpus(row, col) = 0;
        % If no pit here
        elseif CS4300_Ask(KBi, neg_sentence)
            pits(row, col) = 0;
        end
    end
    
end

[rows,cols] = find(pits==0&Wumpus==0);
if ~isempty(rows)
    num_safe = length(rows);
    for s = 1:num_safe
        safe(rows(s),cols(s)) = 1;
        board(rows(s),cols(s)) = 0;
    end
end

if have_gold==0&percept(3)==1
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    plan = [GRAB;so(2:end,end);CLIMB];
end

if isempty(plan)
    OK1 = CS4300_choose1(safe,visited);
    if ~isempty(OK1)
        [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
            [OK1(1),OK1(2),0],'CS4300_A_star_Man');
        plan = [so(2:end,end)];
    end
end

if isempty(plan)
    goal = [];
    neighbors = CS4300_Wumpus_neighbors(agent.x,agent.y);
    num_neighbors = length(neighbors(:,1));
    for n = 1:num_neighbors
        if board(4-neighbors(n,2)+1,neighbors(n,1))<0
            goal = neighbors(n,:);
        end
    end
    if isempty(goal)
        [rows,cols] = find(board==-1);
        if isempty(rows)
            goal = [1,1];
        else
            goal = [cols(1),4-rows(1)+1];
        end
    end
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [goal,0],'CS4300_A_star_Man');
    plan = [so(2:end,end)];
end

if isempty(plan)
    [so,no] = CS4300_Wumpus_A_star(board,[agent.x,agent.y,agent.dir],...
        [1,1,0],'CS4300_A_star_Man');
    plan = [so(2:end,end)];
end

action = plan(1);
plan = plan(2:end);

if action==FORWARD
    [x_new,y_new] = CS4300_move(agent.x,agent.y,agent.dir);
    agent.x = x_new;
    agent.y = y_new;
    visited(4-y_new+1,x_new) = 1;
    board(4-y_new+1,x_new) = 0;
end

if action==RIGHT
    agent.dir = rem(agent.dir+3,4);
end

if action==LEFT
    agent.dir = rem(agent.dir+1,4);
end

if action==GRAB
    have_gold = 1;
end
t = t + 1;
