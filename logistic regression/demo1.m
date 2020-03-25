dataset=[
 2 2 1;
 3.4 5 0;
 2.1 2 1;
 2 1 1;
 5 6.5 0;
 1.5 3 1;
 3 2 1;
 2.8 2 1;
 13 4 0;
 6 4.1 0;
 7.9 1.0 0;
];
hold on;
point='r^ko';
color='rb';
for i1= 1:length(dataset)
    plot(dataset(i1,1),dataset(i1,2),point(dataset(i1,3)*2+1:dataset(i1,3)*2+2));
end
[m n]=size(dataset);
X=[ones(m,1) dataset(:,1:2)];
Y=dataset(:,3);
index=m;
%learning rate & theta vector
alpha=0.001;
theta=zeros(n,1);
theta_temp=zeros(n,1);
flag=1;
j=0;
max_iteration=30000;
%gradient descent
while flag==1
    h_theta=1./(1+exp(-X*theta));
    j=j+1;
    for i= 1:n
        gradient_val=((h_theta-Y)'*X(:,i))*alpha/index;
        theta_temp(i)=theta(i)-gradient_val;
    end
    changing_rate=theta./theta_temp;
    if ((max(changing_rate)<1.0001) & (min(changing_rate)>0.9999))| j==max_iteration
        flag=0;
    end
    theta=theta_temp;
end
h=1./(1+exp(-X*theta));
res_h=h>0.5;
xline=1:0.1:10;

plot(xline,(zeros(1,91)-theta(1,1)*ones(1,91)-theta(2,1)*xline)/theta(3,1));
