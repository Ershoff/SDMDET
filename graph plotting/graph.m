%Description: Plotting graph
% Input:
% 1. mc - matrix coonectivity
% 2. net - data about all net: [origin node, destination node, arc flow, arc time]
% 3. f - flow vector
% 4. len - len of the net 
% 5. high - high of the net.
% Output:
% doesn't matter, function for ploting
% Notes:
% 10 different width of line: 1 - smallest, range_par - biggest.

function [out] = graph(mc, net, f, len, high)
range_par = 5;

figure(1)
title('Tranport graph');
hold on;

% Border
plot([0,len + 1],[0,0],'k-','LineWidth',1);
plot([0,0],[high + 1,0],'k-','LineWidth',1);

% Range flow

f = round(f./max(f)* range_par) + 1;

%Plotting

for i = 1:length(mc)
    for j = 1:length(mc)
        if(mc(i,j) == 1 && j ~= i)
              x1 = mod(i-1,len) + 1;
              x2 = mod(j-1,len) + 1;
              y1 = y_count(i, len);            
              y2 = y_count(j, len);
              
              plot([x1, x2], [y1,y2],'k-','LineWidth',f(find_arc_by_nodes(net,i,j)) )
        end
    end
end



