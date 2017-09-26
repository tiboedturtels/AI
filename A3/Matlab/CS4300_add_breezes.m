function [ KB, KBi ] = CS4300_add_breezes(KB, KBi, vars)
% CS4300_add_breezes - add breeze disjuntions to knowledge base
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

num_vars = length(vars);

for i = 1 + B : B + 16
    KB(length(KB) + 1) =  vars(B + i);
end
end

