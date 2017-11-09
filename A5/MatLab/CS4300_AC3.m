function D_revised = CS4300_AC3(G,D,P)
% CS4300_AC3 - AC3 function from Mackworth paper 1977
% On input:
%     G (nxn array): neighborhood graph for n nodes
%     D (nxm array): m domain values for each of n nodes
%     P (string): predicate function name; P(i,a,j,b) takes as
%     arguments:
%        i (int): start node index
%        a (int): start node domain value
%        j (int): end node index
%        b (int): end node domain value
% On output:
%     D_revised (nxm array): revised domain labels
% Call:
%     G = 1 - eye(3,3);
%     D = [1,1,1;1,1,1;1,1,1];
%     Dr = CS4300_AC3(G,D,’CS4300_P_no_attack’);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

% populate queue with all arcs
queue = [];
G_width = size(G, 1);
for i = 1:G_width
    for j = 1:G_width
        if(G(i, j))
            arc.x = i;
            arc.y = j;
            queue = [queue, arc];
        end
    end
end


D_revised = D;
while ~isempty(queue)
    current = queue(1);
    queue = queue(2 : end);
    [D_revised,revised] = CS4300_Revise(D_revised, current, P);
    if(revised)
        if(D_revised(current.x,:) == zeros(size(D_revised(1,:),2)))
            D_revised = [];
            return
        end
        
        len = size(G);
        for  i = 1:len(1)
            if(i ~= current.y && G(i, current.x) == 1)
                arc.x = i;
                arc.y = current.x;
                queue = [queue, arc];
            end
        end
        
    end
end

return;
               
            