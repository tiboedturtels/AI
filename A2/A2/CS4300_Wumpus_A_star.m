function [solution, nodes] = CS4300_Wumpus_A_star(board,initial_state,goal_state,h_name)
% CS4300_Wumpus_A_star - A* algorithm for Wumpus world
% On input:
%     board (4x4 int array): Wumpus board layout
%       0: means empty cell
%       1: means a pit in cell
%       2: means gold (only) in cell
%       3: means Wumpus (only) in cell
%       4: means gold and Wumpus in cell
%     initial_state (1x3 vector): x,y,dir state
%     goal_state (1x3 vector): x,y,dir state
%     h_name (string): name of heuristic function
% On output:
%     solution (nx4 array): solution sequence of state and the action
%     nodes (search tree data structure): search tree
%       (i).parent (int): index of node’s parent
%       (i).level (int): level of node in search tree
%       (i).state (1x3 vector): [x,y,dir] state represented by node
%       (i).action (int): action along edge from parent to node
%       (i).g (int): path length from root to node
%       (i).h (float): heuristic value (estimate from node to goal)
%       (i).cost (float): g + h   (called f value in text)
%       (i).children (1xk vector): list of node’s children
% Call:
%[so,no] = CS4300_Wumpus_A_star1([0,0,0,0;0,0,0,1;0,2,1,3;0,0,0,0],...
%          [1,1,0],[2,2,1],’CS4300_A_star_Man’)
% so =
%     1     1     0     0
%     2     1     0     1
%     2     1     1     3
%     2     2     1     1
%
% no = 1x9 struct array with fields:
%    parent

nodes(1).parent = [];
nodes(1).level = 0;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).g = 0;
nodes(1).h = feval(h_name,initial_state,goal_state);
nodes(1).cost = nodes(1).h;
nodes(1).children = [];

frontier = [1];
explored = [];

num_nodes = 1;

while(~isempty(frontier))
    node = frontier(1);
    
    explored = [explored, node];
    frontier = frontier(2:end);
    
    if(CS4300_Wumpus_solution(board,nodes(node).state, goal_state))
       solution = CS4300_traceback(nodes, node);
       return
    end
    
    for action = 1:3
       next_state = CS4300_Wumpus_transition(nodes(node).state, action, board);
       if(next_state(1) < 0)
           
       elseif(CS4300_Wumpus_new_state(next_state, [], explored, nodes) == 0)
           
       elseif(CS4300_Wumpus_new_state(next_state, frontier, [], nodes))
            num_nodes = num_nodes + 1;
            nodes(num_nodes).parent = node;
            nodes(num_nodes).level = nodes(node).level + 1;
            nodes(num_nodes).state = next_state;
            nodes(num_nodes).action = action;
            nodes(num_nodes).g = nodes(node).g + 1;
            nodes(num_nodes).h =  feval(h_name,initial_state,goal_state);
            nodes(num_nodes).cost = nodes(num_nodes).h + nodes(num_nodes).g;
            nodes(num_nodes).children = [];
            nodes(node).children = [nodes(node).children,num_nodes];
            frontier = CS4300_Add_node_to_queue(frontier, nodes, num_nodes);
       else
            x = next_state(1);
            y = next_state(2);
            d = next_state(3);
            num_frontier = length(frontier);
            for f = 1:num_frontier
                index = frontier(f);
                f_state = nodes(index).state;
                if f_state(1)==x&&f_state(2)==y&&f_state(3)==d
                    if(nodes(frontier(f)).cost > ...
                            (nodes(node).g + 1 +  feval(h_name,initial_state,goal_state)))
                        num_nodes = num_nodes + 1;
                        nodes(num_nodes).parent = node;
                        nodes(num_nodes).level = nodes(node).level + 1;
                        nodes(num_nodes).state = next_state;
                        nodes(num_nodes).action = action;
                        nodes(num_nodes).g = nodes(node).g + 1;
                        nodes(num_nodes).h =  feval(h_name,initial_state,goal_state);
                        nodes(num_nodes).cost = nodes(num_nodes).h + nodes(num_nodes).g;
                        nodes(num_nodes).children = [];
                        nodes(node).children = [nodes(node).children,num_nodes];
                        frontier = CS4300_Add_node_to_queue(frontier, nodes, num_nodes);
                        
                    end

                end
            end
       end
    end
end
solution =[];