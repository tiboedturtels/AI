function KB_out = CS4300_Tell(KB,sentence) 
% CS4300_Tell - Tell function for logic KB 
% On input: 
%   KB (KB struct): Knowledge base (CNF) 
%       (k).clauses (1xp vector): disjunction clause 
%   sentence (KB struct): query theorem (CNF) 
%       (k).clauses (1xq vector): disjunction
% On output: 
%       KB_out (KB struct): revised KB 
% Call: 
%       KB = CS4300_Tell([],[1]); 
% Author: 
%       William Garnes and Cameron Jackson 
%       UU 
%       Fall 2017 
%

KB_origin = KB;
sentence_size = length(sentence);

for index = 1 : sentence_size
   KB(length(KB) + 1).clauses = sentence(index).clauses; 
end

sentence(1).clauses = [1];
v1 = CS4300_Ask(KB, sentence);
sentence(1).clauses = [-1];
v2 = CS4300_Ask(KB, sentence);

if(v1 == 1 && v2 == 1)
    KB_out = KB_origin;
    return;
end

KB_out = KB;