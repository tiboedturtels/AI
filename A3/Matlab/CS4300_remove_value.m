function sentence = CS4300_remove_value(sentence, value)
% CS4300_remove_value
% On input:
%     sentence (1xn vector): int values
%     value (int) value to be removed from the sentence
% On output:
%     sentence (1xn vector): int values
%        same sentence input if value is not found
%        or sentence input with the value removed at its first instance
% Call Example:
%     sentence = [-1,2,3,4];
%     value = [3];
%     new_sentence = CS4300_remove_value(sentence,value);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

index = -1;
for i = 1:length(sentence)
    if(sentence(i) == value)
       index = i;
       break
    end
end

if(index ~= -1)
    sentence(index) = [];
end