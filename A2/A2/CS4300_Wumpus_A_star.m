function [solution, nodes] = CS4300_Wumpus_A_star(board,initial_state,goal_state,h_name)

nodes(1).parent = [];
nodes(1).level = 0;
nodes(1).state = initial_state;
nodes(1).action = 0;
nodes(1).cost = 0;
nodes(1).distance_to_goal = feval(h_name,initial_state,goal_state);
nodes(1).total_cost = nodes(1).distance_to_goal;
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
            nodes(num_nodes).cost = nodes(node).cost + 1;
            nodes(num_nodes).distance_to_goal =  feval(h_name,initial_state,goal_state);
            nodes(num_nodes).total_cost = nodes(num_nodes).distance_to_goal + nodes(num_nodes).cost;
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
                    if(nodes(frontier(f)).total_cost > ...
                            (nodes(node).cost + 1 +  feval(h_name,initial_state,goal_state)))
                        num_nodes = num_nodes + 1;
                        nodes(num_nodes).parent = node;
                        nodes(num_nodes).level = nodes(node).level + 1;
                        nodes(num_nodes).state = next_state;
                        nodes(num_nodes).action = action;
                        nodes(num_nodes).cost = nodes(node).cost + 1;
                        nodes(num_nodes).distance_to_goal =  feval(h_name,initial_state,goal_state);
                        nodes(num_nodes).total_cost = nodes(num_nodes).distance_to_goal + nodes(num_nodes).cost;
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