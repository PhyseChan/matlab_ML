dataset=loadMNISTImages('train-images.idx3-ubyte');
kl=loadMNISTLabels('train-labels.idx1-ubyte');
[m n]=size(dataset');
X=[ones(1,m); dataset];
Y=zeros(10,60000);
for i=1:60000
    Y(kl(i,1)+1,i)=1;
end
theta_1=normrnd(0,1,20,785);
theta_2=normrnd(0,1,10,20);
theta_1_temp=zeros(20,785);
theta_2_temp=zeros(10,20);
alpha=0.5;
% there is no bias.
hold on;
for iter=1:10000
    z2=theta_1*X;
    a2=sigmoid(z2);
    [m2 n2]=size(a2);
    z3=theta_2*a2;
    a3=sigmoid(z3);
    
    partial_theta_2=(a3-Y).*a3.*(1-a3)*a2';
    partial_a2=theta_2'*((a3-Y).*a3.*(1-a3));
    partial_a2_raw=partial_a2;
    partial_theta_1=a2.*(1-a2).*partial_a2_raw*X';
    
    theta_2=theta_2-partial_theta_2*alpha/m;
    theta_1=theta_1-partial_theta_1*alpha/m;
    if mod(iter,3000)==0
        disp(theta_2);
    end
    plot(iter/100,sum(sum((a3-Y).*(a3-Y)))/(m),'.k');
end