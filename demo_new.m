clc,clear; 
addpath('func\');
data = load('olivetti.mat','X');
label = load('olivetti.mat','Y');
data = struct2cell(data);
label = struct2cell(label);
data = cell2mat(data);
label = cell2mat(label);
data = double(data);
data = mapminmax(data,0,1); 
data = data';
% label = label+1;
label = label';
[~,n] = size(data);
clusters = 10;
anchor_num = 10 * clusters;

[A,B] = init(data, clusters, anchor_num);
[A, obj] = solve(data, A,B);                     
F = B * A;                                            
[~,max_F] = max(F,[],2);
result = ClusteringMeasure_new(label, max_F)




    