function Wumpus = CS4300_gen_wumpus_position(stench) 
% CS4300_WP_estimates - returns a wumpus location that fits the
% criteria
% On input: 
%     stench (4x4 Boolean array): presence of stench percept at cell 
%       -1: no knowledge 
%       0: no stench detected 
%       1: stench detected 
%
% On output: 
%     stench (4x4 [0,1] array): with stench
% Call: % stench = -ones(4,4); 
%     stench(4,1) = 1; 
%     Wumpus = CS4300_gen_pit_board(stench) 
%     Wumpus = [2,1]
% 
% Author: 
%     William Garnes and Cameron Jackson
%     UU 
%     Fall 2016 
%

wumpus = -ones(4,4);
wumpus(4,1) = 0;
Wumpus = [1,1];
%disp(pits)

%check if there are two cells with a stench
wumpus_neighbor = 0;
for row = 1:4
    for col = 1:4
        if stench(row,col) == 1
            wumpus_neighbor = wumpus_neighbor + 1;
            if(row > 1)
               wumpus(row-1, col) = wumpus(row-1, col) + 2; 
            end
            if(row < 4)
               wumpus(row+1, col) = wumpus(row+1, col) + 2; 
            end
            if(col > 1)
               wumpus(row, col-1) = wumpus(row, col-1) + 2; 
            end
            if(col < 4)
               wumpus(row, col+1) = wumpus(row, col+1) + 2; 
            end
        end
    end
end

%if there are two cells with a stench return the neighboring cell
if(wumpus_neighbor >= 2)
   for row = 1:4
      for col = 1:4
         if wumpus(row,col) >= 2
            Wumpus = [row,col];
            return
         end
      end
   end
end

%if there are not two cells with a stench then find where the wumpus is not
wumpus(4,1) = 0;
for row = 1:4
    for column = 1:4
        if(stench(row, column) == 0)
            if(row > 1)
               wumpus(row-1, column) = 0; 
            end
            if(row < 4)
               wumpus(row+1, column) = 0; 
            end
            if(column > 1)
               wumpus(row, column-1) = 0; 
            end
            if(column < 4)
               wumpus(row, column+1) = 0; 
            end
        end
    end
end

%if any cells still have a one return a position around that
%cell if there is a valid position
for row = 1:4
    for column = 1:4
        if(stench(row, column) == 1)
            wumpus_spots = [];
            
            if(row > 1)
                if wumpus(row-1, column) == 1
                    wumpus_spots(length(wumpus_spots)+1).position = [row-1, column];
                end
            end
            
            if(row < 4)
                if wumpus(row+1, column) == 1
                    wumpus_spots(length(wumpus_spots)+1).position = [row+1, column];
                end
            end
            
            if(column > 1)
                if wumpus(row, column-1) == 1
                    wumpus_spots(length(wumpus_spots)+1).position = [row, column-1];
                end
            end
            
            if(column < 4)
                if wumpus(row, column+1) == 1
                    wumpus_spots(length(wumpus_spots)+1).position = [row, column+1];
                end
            end
            index = randi([1,length(wumpus_spots)], 1);
            position = wumpus_spots(index).position;
            Wumpus = position;
            return
        end
    end
end

%cycle through cells that have not been labeled and randomly select one
wumpus_spots = [];
for row = 1:4
   for column = 1:4
      if(wumpus(row,column) == -1)
         wumpus_spots(length(wumpus_spots)+1).position = [row,column];
      end
   end
end

if length(wumpus_spots) == 0
    Wumpus = [-1, -1];
else
    index = randi([1,length(wumpus_spots)], 1);
    position = wumpus_spots(index).position;
    Wumpus = position;
end
        