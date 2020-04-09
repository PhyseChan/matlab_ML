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
hold on;
point='r^ko';
axis equal;
color='rb';
for i1= 1:length(dataset)
    plot(dataset(i1,1),dataset(i1,2),point(dataset(i1,3)*2+1:dataset(i1,3)*2+2));
end
hold on;
[m1 n1]=size(dataset);
X=dataset(:,1:2);
Y=dataset(:,3);
%{x, y, xy, x^2, y^2, x^2y, xy^2, x^3, y^3}
X=[X X(:,1).*X(:,2) X(:,1).*X(:,1) X(:,2).*X(:,2) ];
X=[ones(m1,1) X];
[m n]=size(X);
theta=zeros(n,1);
theta_temp=zeros(n,1);
%learn rate
alpha=0.001;
for i=1:50000
    h_theta=1./(1+exp(-X*theta));
    for j=1:n
        theta_temp(j)=theta(j)-(h_theta-Y)'*X(:,j)*alpha/m;
    end
    theta=theta_temp;
    %plot(i/10,(1./(1+exp(-X*theta))-Y)'*(1./(1+exp(-X*theta))-Y)/m,'k.')
end
xline=-4:0.01:4;
plot(xline,(-(theta(3)+theta(4)*xline)+sqrt(((theta(3)+theta(4)*xline).^2-4*theta(6)*(theta(1)+theta(2)*xline+theta(5)*xline.^2))))/(2*theta(6)),'k.');
plot(xline,(-(theta(3)+theta(4)*xline)-sqrt(((theta(3)+theta(4)*xline).^2-4*theta(6)*(theta(1)+theta(2)*xline+theta(5)*xline.^2))))/(2*theta(6)),'k.');
disp((1./(1+exp(-X*theta))-Y)'*(1./(1+exp(-X*theta))-Y)/m);
