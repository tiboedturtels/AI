function pits = CS4300_gen_pit_board(breezes) 
% CS4300_WP_estimates - creates a random board of pits that fits the
% criteria
% On input: 
%     breezes (4x4 Boolean array): presence of breeze percept at cell 
%       -1: no knowledge 
%       0: no breeze detected 
%       1: breeze detected 
%
% On output: 
%     pits (4x4 [0,1] array): with pits
% Call: % breezes = -ones(4,4); 
%     breezes(4,1) = 1; 
%     pts = CS4300_gen_pit_board(breezes) 
%     pts = 
%     0.2021 0.1967 0.1956 0.1953 
%     0.1972 0.1999 0.2016 0.1980 
%     0.5527 0.1969 0.1989 0.2119 
%     0 0.5552 0.1948 0.1839 
% 
% Author: 
%     William Garnes and Cameron Jackson
% 	  UU 
%     Fall 2016 
%


pits = -ones(4,4);
pits(4,1) = 0;
%disp(pits)

%cycle through the spots that don't have a breeze
%and place no pits around them
for row = 1:4
    for column = 1:4
        if(breezes(row, column) == 0)
            if(row > 1)
               pits(row-1, column) = 0; 
            end
            if(row < 4)
               pits(row+1, column) = 0; 
            end
            if(column > 1)
               pits(row, column-1) = 0; 
            end
            if(column < 4)
               pits(row, column+1) = 0; 
            end
        end
    end
end

%cycle through the spots that have a breeze
%and place a pit around it
for row = 1:4
    for column = 1:4
        if(breezes(row, column) == 1)
            pit_spots = [];
            
            if(row > 1)
                if pits(row-1, column) ~= 0
                    pit_spots(length(pit_spots)+1).position = [row-1, column];
                end
            end
            
            if(row < 4)
                if pits(row+1, column) ~= 0
                    pit_spots(length(pit_spots)+1).position = [row+1, column];
                end
            end
            
            if(column > 1)
                if pits(row, column-1) ~= 0
                    pit_spots(length(pit_spots)+1).position = [row, column-1];
                end
            end
            
            if(column < 4)
                if pits(row, column+1) ~= 0
                    pit_spots(length(pit_spots)+1).position = [row, column+1];
                end
            end
            index = randi([1,length(pit_spots)], 1);
            position = pit_spots(index).position;
            pits(position(1), position(2)) = 1;
        end
    end
end

%cycle through cells that have not been labeled and randomly place a pit
for row = 1:4
   for column = 1:4
      if(pits(row,column) == -1)
         chance = randi([1,5], 1);
         if(chance == 2)
            pits(row,column) = 1;
         else
             pits(row,column) = 0;
         end
      end
   end
end
