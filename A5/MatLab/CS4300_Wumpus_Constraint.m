function p = CS4300_Wumpus_Constraint(i,a,j,b)
% CS6100_P
% On input:
%     i (int): index 1
%     a (int): value 1
%     j (int): index 2
%     b (int): value 2
% On output:
%     p (Boolean): 1 if predicate true; else 0
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%


% p = 1;
% if(i == 1 && b == 0)
%     p = 0;
%     return
% end
% if(j == 1 && a == 0)
%     p = 0;
%     return
% end

constraint = [ 1, 0, 1; 0, 1, 1; 1, 1, 1 ];
p = constraint(a, b);
return