function index = CS4300_string_to_index( str )
% CS4300_string_to_index - converts a string to an index into the variables
% vector
% On input:
%     clause (string): the string to convert
% On output:
%     index (Integer): the converted index
% Call:
%     i = CS4300_string_to_index("G34");
% Author:
%     William Garnes and Cameron Jackson
%     UU
%     Fall 2017
%

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

