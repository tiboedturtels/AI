function [ KB, KBi ] = CS4300_add_clause( clause, KB, KBi, vars )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global current_i


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

KB(current_i).clauses = names;
KBi(current_i).clauses = clause;
current_i = current_i + 1;

end

