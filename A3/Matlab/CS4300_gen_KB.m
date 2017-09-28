function [KB,KBi,vars] = CS4300_gen_KB
% BR_gen_KB - generate Wumpus World logic in KB
% On input:
%     N/A
% On output:
%     KB (CNF KB): KB with Wumpus logic (atom symbols)
%      (k).clauses (string): string form of disjunction
%     KBi (CNF KB): KB with Wumpus logic (integers)
%      (k).clauses (1xp vector): integer form of disjunction
%     vars(struct: vector of strings): list of atom strings
%      (k).var (string): name of atom
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

vars = CS4300_vars();

% preallocate the size to 500
KB = [];
KBi = [];

[KB, KBi] = CS4300_add_breezes(KB, KBi, vars);
[KB, KBi] = CS4300_add_stenches(KB, KBi, vars);
[KB, KBi] = CS4300_add_wumpus(KB, KBi, vars);
[KB, KBi] = CS4300_add_gold(KB, KBi, vars);
end