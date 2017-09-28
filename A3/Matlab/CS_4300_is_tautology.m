function t = CS_4300_is_tautology(sentence)
% CS4300_remove_value
% On input:
%     sentence (1xn vector): int values
% On output:
%     t (boolean value)
%        true if the sentence is a tautology
%        false if it is not
% Call Example:
%     sentence = [-1,2,3,1];
%     tautology = CS_4300_is_tautology(sentence);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

t = false;

for i = 1:length(sentence)-1
    for j = i+1:length(sentence)
       if((sentence(i) + sentence(j)) == 0)
          t = true;
          return
       end
    end
end


