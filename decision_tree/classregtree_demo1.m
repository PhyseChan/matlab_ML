load carsmall % matlab自带数据，可以直接运行。数据包含变量：Horsepower, Weight, MPG
X = [Horsepower Weight];
rtree = fitrtree(X,MPG); % 生成决策树：回归树
view(rtree,'Mode','graph')  % 查看决策树
load fisheriris %matlab自带数据，可以直接运行。% load样本数据
ctree =  fitctree(meas,species); % 生成决策树：分类树
view(ctree,'Mode','graph') % % 查看决策树
