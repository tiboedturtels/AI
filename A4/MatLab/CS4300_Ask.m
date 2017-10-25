function b = CS4300_Ask(KB,sentence)
% CS4300_Ask - Ask function for logic KB
% On input:
%   KB (KB struct): Knowledge base (CNF)
%     (k).clauses (1xp vector): disjunction clause
%   sentence (KB struct): query theorem (CNF)
%     (k).clauses (1xq vector): disjunction
% On output:
%     b (Boolean): 1 if KB entails sentence, else 0
% Call:
%     KB(1).clauses = [1];
%     KB(2).clauses = [-1,2];
%     sentence(1).clauses = [2];
%     b = CS4300_Ask(KB,sentence);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

b = 0;

if isempty(sentence)
    return
end

len_sentence = length(sentence);
for s = 1 : len_sentence
    reverse_sentence = -sentence(s).clauses;
    len_reverse_sentence = length(reverse_sentence);
    KB_clone = KB;
    for index = 1 : len_reverse_sentence
        KB_clone(length(KB_clone) + 1).clauses = reverse_sentence(index);
    end
    CS4300_create_SAT_prob(KB_clone,'HYBKB');
    system('sat.py < HYBKB >popo');
    fd = fopen('popo','r');
    t = fscanf(fd,'%s');
    if ~isempty(t)
        return
    end
    clear t
    fclose(fd);
end

b = 1;
