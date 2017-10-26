function sentence = CS4300_make_percept_sentence(percept,x,y) 
% CS4300_make_percept_sentence - create logical sentence from percept 
% On input: 
%     percept (1x5 Boolean vector): percept 
%        [Stench,Breeze,Glitter,Scream,Bump] 
%     x (int): x location of agent 
%     y (int): y location of agent 
% On output: 
%     sentence (KB struct): logical sentence (CNF) 
%        (1).clauses (int): c1 (index of Sxy if stench), else -c1 
%        (2).clauses (int): c2 (index of Bxy if breeze), else -c2 
%        (3).clauses (int): c3 (index of Gxy if glitter), else -c3 
% Call: 
%     s = CS4300_make_percept_sentence([0,1,0,0,0],3,2); 
% Author: 
%     William Garnes and Cameron Jackson 
%     UU 
%     Fall 2017 
%

%generate the indexes
stench = 1;
breeze = 2;
glitter = 3;

%initially set to positive
sentence(stench).clauses = CS4300_get_var_index('S', x, y);
sentence(breeze).clauses = CS4300_get_var_index('B', x, y);
sentence(glitter).clauses = CS4300_get_var_index('G', x, y);

%negate if needed
if(percept(stench) == false)
    sentence(stench).clauses = -1 * sentence(stench).clauses;
end
if(percept(breeze) == false)
    sentence(breeze).clauses = -1 * sentence(breeze).clauses; 
end
if(percept(glitter) == false)
    sentence(glitter).clauses = -1 * sentence(glitter).clauses;
end

