%Stable dynamic model
%input: 
%net - information about time on each arc. (origin, destination, time, flow)
%pairs - mass of demand pairs (origin, destination)
%mc - matrix connextovity
%d - demand for each pair
%t - time vector (argument)
%Output:
%fun - value of the func
%grad - grad of the func

function [fun, grad] = SDM(net, mc, pairs, d, t)
    routes = zeros(size(pairs,1), size(net,1));
    Tk = zeros(size(pairs,1),1);
    for k = 1:size(pairs,1)
%        o = pairs(k,1)
%        d = pairs(k,2)
        [vects, sum_time] = short_path_find(mc, net, t, pairs(k,1), pairs(k,2));
        Tk(k) = sum_time;
        routes(k, :) = convex_sum(vects,1);
    end
    
    fun = ( (net(:,4))' )* ( t - net(:,3)) - d'*Tk;
    
    grad = net(:,4) - (d'*routes)';   %column - row*mat
    
end