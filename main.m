clc; clear;

%% Initial parameters
%Net generation parameters
len = 10;
high = 10;
save_flag = 0;
load_flag = 0;
path_to_file = 'C:\Users\Egorius\Desktop\SDModel\Alpha\g10x10.mat';

%% Generate manhattan net
%net - information about time on each arc. (origin, destination, time, flow)
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);

%% Model part
pairs = making_pairs_func(len*high)

num_iter = 7;
e = 0.1;
d = zeros(size(pairs,1),1);
d(8) = 0.3 

tic
[t, F] = PGM(num_iter, net, mc, pairs, d, e)
toc


t - net(:,3)

%% Output part
%graph(mc, net, net(:,4), len, high)




