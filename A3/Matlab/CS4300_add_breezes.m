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

for breeze_cell = 1 + B : B + 16
    other_cells = [];
    
    breeze_chars = char(vars(breeze_cell));
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
    
    % Add binary disjunctions
    for cell_i = 1 : length(other_cells)
        clause = [ breeze_cell, -1 * other_cells(cell_i) ];
        [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
    end
    
    % Add the big clause
    clause = [ -1 * breeze_cell, other_cells ];
    [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
end
end

