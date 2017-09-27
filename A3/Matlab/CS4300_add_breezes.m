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

global current_i;

for i = 1 + B : B + 16
    breeze_cell = B + i;
    other_cells = [];
    
    breeze_chars = char(vars(i));
    breeze_x = str2num(breeze_chars(2));
    breeze_y = str2num(breeze_chars(3));
    
    if(breeze_x ~= 1)
        other_cells(length(other_cells) + 1) = P + (breeze_y - 1) * 4 + breeze_x - 1;
    end
    if(breeze_x ~= 4)
        other_cells(length(other_cells) + 1) = P + (breeze_y - 1) * 4 + breeze_x + 1;
    end
    if(breeze_y ~= 1)
        other_cells(length(other_cells) + 1) = P + (breeze_y - 2) * 4 + breeze_x;
    end
    if(breeze_y ~= 4)
        other_cells(length(other_cells) + 1) = P + (breeze_y - 0) * 4 + breeze_x;
    end
    
    KB(current_i).clauses = vars(B + i);
    KBi(current_i).clauses = B + i;
    current_i = current_i + 1;
end
end

