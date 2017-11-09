function [ KB, KBi ] = CS4300_add_gold( KB, KBi, vars )
% CS4300_add_gold - add all gold-related disjunctions to knowledge base
% On input:
%     KB (CNF KB): current KB with Wumpus logic (atom symbols)
%      (k).clauses (string): string form of disjunction
%     KBi (CNF KB): current KB with Wumpus logic (integers)
%      (k).clauses (1xp vector): integer form of disjunction
%     vars(struct: vector of strings): list of atom strings
%      (k).var (string): name of atom
% On output:
%     KB (CNF KB): updated KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): updated KB with Wumpus logic (integers)
% Call:
%     KB = [];
%     KBi = [];
%     vars = CS4300_vars();
%     [KB,KBi] = CS4300_add_gold(KB, KBi, vars);
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

gold_exists = zeros(1, 16);

for i = 1: 16
    gold_exists(i) =  G + i;
end
[KB, KBi] = CS4300_add_clause(gold_exists, KB, KBi, vars);


for i = 1: 15
   for j = i + 1 : 16
      clause = [-1 * (G + i), -1 * (G + j)];
      [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
   end
end

for i = 1: 16
   clause = [-1 * (G + i), -1 * (P + i)];
   [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
end