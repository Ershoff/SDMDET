clc; clear;
%% Description of main parameters

% 1. d - demand flow(row-vector)
% 2. e - accurancy
% 3. num - number of iteration of UPGM
% 4. len - len of a net
% 5. high - high of a net



%% Initial parameters
%Net generation parameters
len = 3;
high = 3;
save_flag = 0;
load_flag = 0;
path_to_file = 'test3x3.mat';



%% Generate manhattan net
%net - information about time on each arc. (origin, destination, time, flow)
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);
pairs = making_pairs_func(len*high);
%Print net
net;
 
%% Model part

d = zeros(1, size(pairs,1))./10;
d(1) = 0.01;


e = 0.1;
num = 100;


[t, F] = PGM(net, mc, pairs, d, num, e)

 
%% Output part
%    graph(mc, net, t, len, high)
 
 
 
 
