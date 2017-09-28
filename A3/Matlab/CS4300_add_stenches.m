function [ KB, KBi ] = CS4300_add_stenches(KB, KBi, vars)
% CS4300_add_stenches - add stench disjuntions to knowledge base
% On input:
%     KB (CNF KB): current KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): current KB with Wumpus logic (integers)
%     vars(struct: vector of strings): list of atom strings
% On output:
%     KB (CNF KB): updated KB with Wumpus logic (atom symbols)
%     KBi (CNF KB): updated KB with Wumpus logic (integers)
% Call:
%     [KB,KBi] = CS4300_gen_KB(KB, KBi, vars);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

B = 0;
G = 16;
W = 32;
S = 48;
W = 64;

for stench_cell = 1 + S : S + 16
    other_cells = [];
    
    stench_chars = char(vars(stench_cell));
    stench_x = str2num(stench_chars(2));
    stench_y = str2num(stench_chars(3));
    
    if(stench_x ~= 1)
        other_cells(length(other_cells) + 1) = W + (stench_y - 1) * 4 + stench_x - 1;
    end
    if(stench_x ~= 4)
        other_cells(length(other_cells) + 1) = W + (stench_y - 1) * 4 + stench_x + 1;
    end
    if(stench_y ~= 1)
        other_cells(length(other_cells) + 1) = W + (stench_y - 2) * 4 + stench_x;
    end
    if(stench_y ~= 4)
        other_cells(length(other_cells) + 1) = W + (stench_y - 0) * 4 + stench_x;
    end
    
    % Add binary disjunctions
    for cell_i = 1 : length(other_cells)
        clause = [ stench_cell, -1 * other_cells(cell_i) ];
        [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
    end
    
    % Add the big clause
    clause = [ -1 * stench_cell, other_cells ];
    [KB, KBi] = CS4300_add_clause(clause, KB, KBi, vars);
end
end

