hold on;
dataset=[
    0.5 0.5 0;
    0.9 1.2 0;
    2.6 1.2 1;
    2.8 3.4 0;
    3.2 1 0;
    4 2 0;
    2.1 1.4 1;
    2.9 2 1;
    1.5 1 0;
    2 3.5 0;
    2.3 2.3 1;
    1.2 2 0;
    ];
% dataset=[
%     1 1 0;
%     -2.8 -2.6 1;
%     2.2 0.5 1;
%     0.5 -0.5 0;
%     2.1 1.7 1;
%     -2 2.4 1;
%     1.5 0.5 0;
%     1 -1 1;
%     -2.3 1.2 1;
%     1.6 2.1 1;
%     0.5 0.5 0;
%     -1 1.6 1;
%     -0.7 -0.55 0;
% ];

[m n]=size(dataset);
dataset_new=sum(dataset)/m;
dataset_max=max(dataset);
dataset_min=min(dataset);
X=(dataset(:,1:2)-dataset_new(1:2))./(dataset_max(1:2)-dataset_min(1:2));
X=[ones(m,1) X]';
Y=dataset(:,3)';
theta_1=[0.1 -0.4 0.3;-0.353 0.125 -0.4546;-0.245 -0.113 0.641;0.23 -0.5442 0.5453];
theta_2=[-0.1312 0.3367 -0.1442 -0.001];
theta_1_temp=zeros(4,3);
theta_2_temp=zeros(1,3);
alpha=0.5;
% there is no bias.
for iter=1:40000
    z2=theta_1*X;
    a2=sigmoid(z2);
    [m2 n2]=size(a2);
    z3=theta_2*a2;
    a3=sigmoid(z3);
    
    partial_theta_2=(a3-Y).*a3.*(1-a3)*a2';
    partial_a2=theta_2'*(a3-Y).*a3.*(1-a3);
    partial_a2_raw=partial_a2;
    partial_theta_1=a2.*(1-a2).*partial_a2_raw*X';
    
    theta_2=theta_2-partial_theta_2*alpha/m;
    theta_1=theta_1-partial_theta_1*alpha/m;
    if mod(iter,3000)==0
        disp(theta_2);
    end
    plot(iter/1000,(a3-Y)*(a3-Y)'/m,'.k');
end




