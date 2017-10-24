function [ KB, KBi ] = CS4300_add_clause( clause, KB, KBi, vars )
% CS4300_add_clause - add clause to the knowledge base
% On input:
%     clause (Vector of Integers):the clause to be added
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
%     clear;
%     c = [1, 2];
%     KB = [];
%     KBi = [];
%     vars = ["G11", "P11"];
%     [KB,KBi] = CS4300_add_clause(c, KB, KBi, vars);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%


clause = sort(clause);
num_vars = length(clause);
names = "";
for i = 1 : num_vars
    current = clause(i);
    if(current < 0)
        names = strcat(names, "~");
        current = abs(current);
    end
    
    names = strcat(names, vars(current), " ");
end

kb_size = length(KB);
KB(kb_size + 1).clauses = names;
KBi(kb_size + 1).clauses = clause;

end

