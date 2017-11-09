function [row,col] = CS4300_best_frontier(visited, pits, Wumpus) 
% CS4300_best_frontier - returns the best frontier cell based on probable
% safety
% On input: 
%     visited (4x4 Boolean vector): the cells the agent has visited 
%     pits (4x4 Float vector): estimated probabilities for pits
%     Wumpus (4x4 Float vector): estimated probabilities for Wumpuses
% On output: 
%     row: selected row
%     col: selected column
% Call:
%     visited = zeros(4, 4);
%     visited(4, 1) = 1;
%     pits = zeros(4, 4);
%     Wumpus = zeros(4, 4);
%     Wumpus(4, 2) = 1;
%     [row, col] = CS4300_best_frontier(visited, pits, Wumpus); 
% Author:
%     Cameron Jackson and William Garnes
%     UU
%     Fall 2017
%
row = 1; 
col = 1; 
highest_safety = 0;
for r = 1:4 
    for c = 1:4 
        if visited(r,c)==1 
            nei = BR_Wumpus_neighbors(c,4-r+1); 
            num_nei = length(nei(:,1));
            for n = 1:num_nei 
                if visited(4-nei(n,2)+1,nei(n,1))==0
                    current_row = 4 - nei(n,2) + 1; 
                    current_col = nei(n,1); 
                    safety = 1 - max(pits(current_row, current_col), Wumpus(current_row, current_col));
                    if safety > highest_safety
                        row = current_row;
                        col = current_col;
                        highest_safety = safety;
                    end
                end
            end
        end
    end
end