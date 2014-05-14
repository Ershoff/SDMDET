%% Description:
%Build vector(size of nonsero position) with element equal to nonzero
%position in line_find.
%% Input:
%1. line_find - vector
%% Output:
%1. mass - vector whose elements equals to number of nonzero position in
% line_find.

function [mass] = nonzero_pos (line_find)
    a = zeros(1,0);
    count = 1;
    for i = 1:length(line_find)
        if(line_find(i) ~= 0)
            a(count) = i;
            count = count + 1;
        end
    end

    mass = a;
end