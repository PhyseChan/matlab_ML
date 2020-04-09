dataset=[
    1 1 0;
    -2.8 -2.6 1;
    2.2 0.5 1;
    0.5 -0.5 0;
    2.1 1.7 1;
    -2 2.4 1;
    1.5 0.5 0;
    1 -1 1;
    -2.3 1.2 1;
    1.6 2.1 1;
    0.5 0.5 0;
    -1 1.6 1;
    -0.7 -0.55 0;
];

[m n]=size(dataset);
dataset_new=sum(dataset)/m;
dataset_max=max(dataset);
dataset_min=min(dataset);
X=(dataset(:,1:2)-dataset_new(1:2))./(dataset_max(1:2)-dataset_min(1:2));
X=[ones(m,1) X]';
Y=dataset(:,3)';
theta_1=[0.1 -0.4 0.3;-0.353 0.125 -0.4546;-0.245 -0.113 0.641;0.23 -0.5442 0.5453];
theta_2=[-0.1312 0.3367 -0.1442 -0.001 ];
theta_1_temp=zeros(4,3);
theta_2_temp=zeros(1,4);
alpha=0.01;
hold on;
for iter =1 :7
    for item =1:m

        z2=theta_1*X(:,m);
        a2=sigmoid(z2);
        z3=theta_2*a2;
        a3=sigmoid(z3);
        delta3=(a3-Y(m)).*z3.*(1-z3);
        delta2=z2.*(1-z2).*delta3.*theta_2';
        
        partial_theta_2=delta3.*a2;
        partial_theta_1=delta2*X(:,m)';
        
        theta_1=theta_1-partial_theta_1*alpha/m;
        theta_2=theta_2-partial_theta_2*alpha/m;

    end

    plot(iter/10,(theta_2*theta_1*X-Y)*(theta_2*theta_1*X-Y)'/m,'.k');
end
