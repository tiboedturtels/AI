function b = CS4300_Ask(KB,sentence) 
% CS4300_Ask - Ask function for logic KB 
% On input: 
% KB (KB struct): Knowledge base (CNF) 
% (k).clauses (1xp vector): disjunction clause 
% sentence (KB struct): query theorem (CNF) 
% (k).clauses (1xq vector): disjunction 
% On output: 
% b (Boolean): 1 if KB entails sentence, else 0 
% Call: 
% KB(1).clauses = [1]; 
% KB(2).clauses = [-1,2]; 
% sentence(1).clauses = [2]; 
% b = CS4300_Ask(KB,sentence); 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

kb_size = length(KB);
vars = [];

%add variables in the kb to vars
for index = 1 : kb_size
    kb_vars = abs(KB(index).clauses);
    vars = union(vars, kb_vars);
end

sentence_size = length(sentence);
true_count = 0;

for index = 1 : sentence_size
   sent = sentence(index).clauses;
   sentence_vars = abs(sent);
   temp_vars = union(vars, sentence_vars);
   Sip = CS4300_RTP(KB, sent, temp_vars);
   if(isempty(Sip))
       true_count = true_count + 1;
   else
       break
   end
end

b = true_count == sentence_size;