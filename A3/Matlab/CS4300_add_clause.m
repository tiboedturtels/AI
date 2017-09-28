function [ KB, KBi ] = CS4300_add_clause( clause, KB, KBi, vars )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

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

