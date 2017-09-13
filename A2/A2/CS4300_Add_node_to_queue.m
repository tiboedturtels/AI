function queue = CS4300_Add_node_to_queue(queue, nodes, node_number)
length = size(queue);
if(isempty(queue))
    queue = [node_number];
    return
    
elseif(nodes(node_number).total_cost < nodes(queue(1)).total_cost)
    queue = [node_number,queue];
    return
else
    for index = queue
       if(nodes(node_number).total_cost < nodes(index).total_cost)
          queue = [queue(1:index-1),node_number,queue(index:end)];
          return
       end
    end
end
queue = [queue, node_number];