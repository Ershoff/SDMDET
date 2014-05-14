
function [x, F] = PGM(Num, net, mc, pairs, d, e)
    
    L = 1;
    
    x = ones(size(net,1),1);
    [f, grad] = SDM(net, mc, pairs, d, x);
        
    for k = 1:Num
        i = 0;
        k
        while true
            M = (2^i) * L;
            x_new = Beta(x, grad, M);
            x_new = proj(net,x_new);
            [f_new, grad_new] = SDM(net, mc, pairs, d, x_new);
%             f,x,M,f_new,x_new;
            if (f_new < (f + e/2))
                break;
            end
            i = i + 1;  
        end
        f = f_new;
        grad = grad_new;
        x = x_new;
        L = M/2; 
    end
    
    F = f_new;
    grad;
end

 
