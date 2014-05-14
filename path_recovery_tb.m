clc;
clear;

mc = [0,1,0,1,0,0;
      0,0,1,0,1,0;
      0,0,0,0,0,1;
      0,0,0,0,1,0;
      0,0,0,0,0,1;
      0,0,0,0,0,0];

% mc = [0,1,1,0;
%       0,0,0,1;
%       0,0,0,1;
%       0,0,0,0];
  
node_d = 6;

node_number = length(mc);
path_mass = zeros(node_number, node_number);
path_mass(1, 1) = node_d;

path_mass = path_recovery(mc, path_mass, 1)