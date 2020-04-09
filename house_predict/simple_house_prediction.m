% dataset=[
%   1  2.1 4;
%   1  1.6 3.3;
%   1  2.4 3.6;
%   1  1.4 2.3;
%   1  3 5.4
% ];
dataset=[
  1  2104 400;
  1  1600 330;
  1  2400 369;
  1  1416 232;
  1  3000 540;
  1  4000 650;
];
hold on
axis=([0 5000 0 600]);
x=dataset(:,1:2);
y=dataset(:,3);
theta=[51;0.18];
theta_temp=[0;0];
%alpha=0.000000421;
alpha=0.000000001;
% for i=1:600
%     for j=1:2
%         sum=0;
%         for k=1:6
%             sum=sum+(x(k,:)*theta-y(k))*x(k,j);
%         end
%         theta_temp(j,:)=theta(j,:)-sum*alpha/6;
%         theta=theta_temp;
%     end
%     plot(i/100,(x*theta-y)'*(x*theta-y)/6,'k.')
% end
for i=1:2000
   for j=1:2
       gradient_val=x(:,j)'*(x*theta-y);
       theta_temp(j)=theta(j)-alpha*gradient_val/6;
   end
   theta=theta_temp;
   plot(i/10,(x*theta-y)'*(x*theta-y)/6,'k.')
end    
disp((x*theta-y)'*(x*theta-y)/6)



