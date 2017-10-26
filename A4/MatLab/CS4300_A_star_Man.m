function c = CS4300_A_star_Man(state1,state2)
% CS4300_A_star_Man - Manhatten distance function
% On input:
%     state1 (1x3 vector): Wumpus agent state [x1 y1 dir1]
%     state2 (1x3 vector): Wumpus agent state [x2 y2 dir2]
% On output:
%     c (int): Manhatten distance (number of blocks between 2 locations
% Call:
%     d = CS4300_A_star_Man([1,1,0],[3,2,1]);
% Author:
%     T. Henderson
%     UU
%     Fall 2015
%

c = sum(abs(state1(1:2)-state2(1:2)));
