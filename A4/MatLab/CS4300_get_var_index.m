function index = CS4300_get_var_index( type, x, y )
% CS4300_get_var_index - converts a string to an index into the variables
% vector
% On input:
%     type (char): B, G, P, S, or W based on what kind of information
%     x (int): the x position
%     y (int): the y position
% On output:
%     index (Integer): the converted index
% Call:
%     i = CS4300_string_to_index(B, 1, 1);
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

type_offset = 0;
if type == 'B'
    type_offset = 0;
elseif type == 'G'
    type_offset = 16;
elseif type == 'P'
    type_offset = 32;
elseif type == 'S'
    type_offset = 48;
elseif type == 'W'
    type_offset = 64;
end

y_offset = (y - 1) * 4;
x_offset = x;

index = type_offset + y_offset + x_offset;

end

