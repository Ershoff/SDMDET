%% Description: Function is making vector of incidence from path vector.
%% Input:
% path - 1-dimention mass, which corresponds to number of nodes. in
% 2-dimentional case it response to few equal paths.
% net - information about net (origin, destination, time, flow)
%% Ouptut:
% Incidence vectors. size(number of paths*number of nodes)
%%
function [incidence] = path_to_incidense(paths, net)
   
   [n,m] = size(paths);
   
   max_n = 0;
   max_m = 0;
   
   for i = 1:n
      for j = 1:m 
          if(paths(i,j) ~= 0)
             if(j > max_m) 
                 max_m = j;
             end
             if(i > max_n)
                 max_n = i;
             end
          end
      end
   end
   paths = paths(1:max_n, 1:max_m);
   
   mat_per_size = size(paths,2);
   mat_per = zeros(mat_per_size,mat_per_size);
   for i = 1:1:mat_per_size
      for j = 1:1:mat_per_size
         if(i == mat_per_size-j+1)
             mat_per(i,j) = 1;
         end
      end
   end
   
   paths = paths*mat_per;
   
   path_vect = zeros(size(net, 1), size(paths,1));
   for i = 1:size(paths,1)
       for j = 1 : (size(paths,2)-1)
           path_vect(find_arc_by_nodes(net, paths(i,j), paths(i, j + 1)),i) = 1; 
       end
   end
   
   incidence = path_vect;
end