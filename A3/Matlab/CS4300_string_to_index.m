function index = CS4300_string_to_index( str )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

chars = char(str);

type = chars(1);
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

y_offset = (str2num(chars(2)) - 1) * 4;
x_offset = str2num(chars(3));

index = type_offset + y_offset + x_offset;

end

