function KB_out = CS4300_Tell(KB,sentence) 
% CS4300_Tell - Tell function for logic KB 
% On input: 
% KB (KB struct): Knowledge base (CNF) 
% (k).clauses (1xp vector): disjunction clause 
% sentence (KB struct): query theorem (CNF) 
% (k).clauses (1xq vector): disjunction
% On output: 
% KB_out (KB struct): revised KB 
% Call: 
% KB = CS4300_Tell([],[1]); 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

sentence_size = length(sentence);

for index = 1 : sentence_size
   KB(length(KB) + 1).clauses = sentence(index).clauses; 
end

KB_out = KB;