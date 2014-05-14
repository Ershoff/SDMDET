clc; clear;
%% Description of main parameters

% 1. d - demand flow(row-vector)


%% Initial parameters
%Net generation parameters
len = 2;
high = 2;
save_flag = 0;
load_flag = 0;
path_to_file = 'test2x2.mat';



%% Generate manhattan net
%net - information about time on each arc. (origin, destination, time, flow)
[net, mc] = generate_manhatan(len, high, save_flag, load_flag, path_to_file);

%  Square graph
mc = [1,1,1,0;
      0,1,0,1;
      0,0,1,1;
      0,0,0,1]

p = [1,0,0,0,0,0,0,0;
     0,1,0,0,0,0,0,0;
     0,0,0,1,0,0,0,0;
     0,0,0,0,0,1,0,0];
net = p*net;

%1,2

net(1,3) = 1;
net(1,4) = 2; %flow

net(3,3) = 1;
net(3,4) = 2; %flow

%3,4

net(2,3) = 2;
net(2,4) = 4; %flow

net(4,3) = 2; 
net(4,4) = 4; %flow

net

 
%% Model part
%pairs = making_pairs_func(len*high);
pairs = [1,4];


d = 3.5; % 1-3

e = 0.01;
num = 100;
 
[t, F] = PGM(net, mc, pairs, d, num, e)
 
 
%% Output part
 %graph(mc, net, net(:,4), len, high)
 
 
 
 
