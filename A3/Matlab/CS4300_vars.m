function vars = CS4300_vars
% CS4300_vars - string array for the  var names
% On input:
%     N/A
% On output:
%     vars : array of strings of the form : ["B11", "B12", ..., "W44"]
%     in alphabetical order
% Call:
%     vars = CS4300_vars;
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

vars = strings(1, 80);

% Breezes
for i = 1 : 4
    for j = 1 : 4
         this_str = strcat("B", num2str(i), num2str(j));
         vars(4 * (i - 1) + j) = this_str;
    end
end

% Gold
for i = 1 : 4
    for j = 1 : 4
         this_str = strcat("G", num2str(i), num2str(j));
         vars(4 * (i - 1) + j + 16) = this_str;
    end
end

% Pits
for i = 1 : 4
    for j = 1 : 4
         this_str = strcat("P", num2str(i), num2str(j));
         vars(4 * (i - 1) + j + 32) = this_str;
    end
end

% Stenches
for i = 1 : 4
    for j = 1 : 4
         this_str = strcat("S", num2str(i), num2str(j));
         vars(4 * (i - 1) + j + 48) = this_str;
    end
end

% Wumpus
for i = 1 : 4
    for j = 1 : 4
         this_str = strcat("W", num2str(i), num2str(j));
         vars(4 * (i - 1) + j + 64) = this_str;
    end
end
end

