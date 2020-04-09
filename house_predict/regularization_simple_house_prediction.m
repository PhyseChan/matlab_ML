% dataset=[
%   1  21 400;
%   1  16 330;
%   1  24 369;
%   1  14 232;
%   1  30 540;
%   1  40 650;
% ];
dataset=[
    1 0.9 31;
    1 1 21;
    1 3 -318;
    1 2.7 -300;
    1 4.6 1116;
    1 5.3 1112;
    ];
hold on
x=dataset(:,1:2);
x=[x x(:,2).^2 x(:,2).^3];
y=dataset(:,3);
theta=(inv(x'*x))*x'*y;
disp((x*theta-y)'*(x*theta-y)/6);
xline=1:0.1:10;
plot(dataset(:,2),dataset(:,3),'r*');
xmatrix=[xline*0+1; xline; xline.^2; xline.^3];
plot(xline,theta'*xmatrix,'k.');