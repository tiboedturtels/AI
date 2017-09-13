function queue = CS4300_Add_node_to_queue(queue, nodes, node_number)
% CS4300_agent_Astar - A* search agent example
%    adds the index node_numer into the queue
%    the node_number will be put in based on the
%    lowest total_cost for the nodes
%    if there are ties then node number will 
%    always be last
%
% On input:
%     queue ([1*N] vector of values)
%     nodes ([1*N] vector of nodes)
%     node_number(int of the index of the node that was added)
%
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017

if(isempty(queue))
    queue = [node_number];
    return
    
elseif(nodes(node_number).cost < nodes(queue(1)).cost)
    queue = [node_number,queue];
    return
else
    for index = queue
       if(nodes(node_number).cost < nodes(index).cost)
          queue = [queue(1:index-1),node_number,queue(index:end)];
          return
       end
    end
end
queue = [queue, node_number];