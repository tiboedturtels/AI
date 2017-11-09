function [row,col] = CS4300_best_frontier(visited, pits, Wumpus) 
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