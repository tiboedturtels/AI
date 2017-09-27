function [ KB, KBi ] = CS4300_add_wumpus( KB, KBi, vars )
% CS4300_add_breezes - add wumpus disjuntions to knowledge base
% On input:
%     KB (CNF KB): current KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): current KB with Wumpus logic (integers)
%     vars(struct: vector of strings): list of atom strings
% On output:
%     KB (CNF KB): updated KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): updated KB with Wumpus logic (integers)
% Call:
%     [KB,KBi,vars] = CS4300_gen_KB;
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

B = 0;
G = 16;
P = 32;
S = 48;
W = 64;

wupus_exists = zeros(1, 16);

for i = 1: 16
    wupus_exists(i) =  W + i;
end
[KB, KBi] = CS4300_add_clause(wupus_exists, KB, KBi, vars);


for i = 1: 15
   for j = i + 1 : 16
      clause = [-1 * (W + i), -1 * (W + j)];
      [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
   end
end

for i = 1: 16
   clause = [-1 * (W + i), -1 * (P + i)];
   [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
end