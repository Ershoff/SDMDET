% Convex sum
% Input:
% 1. mat - Matrix n*m, m vectors in R^n.
% 2. flag - flag = 0, then make cvx sum, flag~=0 pick num = flag vector
% from matrix
% Output:
% 1. vec - vector equal to convex sum of m vectors.

function [vec] = convex_sum(mat, flag)
    if(flag == 0)
        lambda = rand(1, size(mat, 2));
        lambda = lambda./sum(lambda);
        vect_temp = zeros(size(mat,1),1);
        for i = 1:1:size(mat,2)
            vect_temp = vect_temp + mat(:,i).*lambda(i);
        end   
        vec = vect_temp;
    end
    if(flag ~= 0)
        vec = mat(:,flag);
    end
end