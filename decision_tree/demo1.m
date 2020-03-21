iris(1:51,5)=1;
iris(52:101,5)=2;
iris(102:150,5)=3;
r=randperm(size(iris,1));
[row,col]=size(iris);
dataset=iris(r,:);
training_data=dataset(1:row*0.7,:);
test_data=dataset(row*0.7+1:row,:);
