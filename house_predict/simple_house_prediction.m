% dataset=[
%   1  2.1 4;
%   1  1.6 3.3;
%   1  2.4 3.6;
%   1  1.4 2.3;
%   1  3 5.4
% ];
dataset=[
  1  2100 400;
  1  1600 330;
  1  2400 369;
  1  1410 232;
  1  3000 540
];
hold on
axis=([0 5000 0 600]);
x=dataset(:,1:2);
y=dataset(:,3);
theta=[0;0];
theta_temp=[0;0];
alpha=0.0000001;
for i=1:100
    for j=1:2
        sum=0;
        for k=1:5
            sum=sum+(x(k,:)*theta-y(k))*x(k,j);
        end
        theta_temp(j,:)=theta(j,:)-sum*alpha/5;
        theta=theta_temp;
    end
    plot(i/100,(x*theta-y)'*(x*theta-y)/5,'k.')
end

disp((x*theta-y)'*(x*theta-y)/5)



