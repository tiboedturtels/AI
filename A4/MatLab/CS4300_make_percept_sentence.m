function sentence = CS4300_make_percept_sentence(percept,x,y) 
% CS4300_make_percept_sentence - create logical sentence from percept 
% On input: 
% percept (1x5 Boolean vector): percept 
% [Stench,Breeze,Glitter,Scream,Bump] 
% x (int): x location of agent 
% y (int): y location of agent 
% On output: 
% sentence (KB struct): logical sentence (CNF) 
% (1).clauses (int): c1 (index of Sxy if stench), else -c1 
% (2).clauses (int): c2 (index of Bxy if breeze), else -c2 
% (3).clauses (int): c3 (index of Gxy if glitter), else -c3 
% (4).clauses (int): c4 (index of Cxy if scream), else -c4 
% (5).clauses (int): c5 (index of Exy if bump), else -c5 
% Call: 
% s = CS4300_make_percept_sentence([0,1,0,0,0],3,2); 
% Author: 
% William Garnes and Cameron Jackson 
% UU 
% Fall 2017 
%

%generate the indexes
stench = 1;
breeze = 2;
glitter = 3;
scream = 4;
bump = 5;

%create the sentence variable
sentence(stench).clauses = 0;
sentence(breeze).clauses = 0;
sentence(glitter).clauses = 0;
sentence(scream).clauses = 0;
sentence(bump).clauses = 0;

if(percept(stench) == true)

else
    
end
if(percept(breeze) == true)
    
else
    
end
if(percept(glitter) == true)
    
else
    
end
if(percept(scream) == true)
    
else
    
end
if(percept(bump) == true)
    
else
    
end