function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
% On input:
%     sentences (CNF data structure): array of conjuctive clauses
%       (i).clauses
%           each clause is a list of integers (- for negated literal)
%     thm (CNF datastructure): a disjunctive clause to be tested
%     vars (1xn vector): list of variables (positive integers)
% On output:
%     Sip (CNF data structure): results of resolution
%        []: proved sentence |- thm
%        not []: thm does not follow from sentences
% Call:  (example from Russell & Norvig, p. 252)
%     DP(1).clauses = [-1,2,3,4];
%     DP(2).clauses = [-2];
%     DP(3).clauses = [-3];
%     DP(4).clauses = [1];
%     thm(1).clauses = [4];
%     vars = [1,2,3,4];
%     Sr = CS4300_RTP(DP,thm,vars);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

Sip = -1;

for value = thm(1).clauses
    sentences(length(sentences) + 1).clauses = [value * -1];
end

new = [];

new_added = 1;
while(new_added)
   new_added = 0;
   for i = 1 : length(sentences) - 1
      for j = i + 1 : length(sentences)
          sentence1 = sentences(i).clauses;
          sentence2 = sentences(j).clauses;
          for number = sentence1
             if(ismember(-1 * number, sentence2))
                 sentence11 = CS4300_remove_value(sentence1, number);
                 sentence22 = CS4300_remove_value(sentence2, number*-1);
                 new_sentence = union(sentence11, sentence22);
                 if(isempty(new_sentence))
                     Sip = [];
                    return 
                 end
                 if(~CS_4300_is_tautology(new_sentence))
                    new(length(new)+1).clauses = new_sentence;
                 end
             end
          end
      end
   end
   
    new_to_add = [];
    for new_sentence = new
        is_new = true;
        for old_sentence = sentences
            if(isequal(new_sentence.clauses, old_sentence.clauses))
                is_new = false;
                break
            end
        end
        if(is_new)
            new_to_add(length(new_to_add)+1).clauses = new_sentence.clauses;
        end
    end
   
    for new_sentence = new_to_add
        new_added = 1;
        sentences(length(sentences)+1).clauses = new_sentence.clauses; 
    end
    
    new = [];
   
end