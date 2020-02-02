data_set=[
    1.5 2.5 -1;
    -1 -0.7 1;
    -1 -4 1;
    -1 1.3 1;
    -1.5 1 1;
    -1.5 2.5 1;
    -0.5 -2 1;
    1.8 -2.1 -1;
    1 1 -1;
    2 1 -1;
    1 4 -1;
    2 -1 -1;

];
hold on;
axis equal;
axis([-5 5 -5 5]);

grid on;
grid minor;
x=linspace(-5,5);
for i=1:length(data_set)
    if data_set(i,3)==-1
        plot(data_set(i,1),data_set(i,2),'.b');
    else
        plot(data_set(i,1),data_set(i,2),'*r');
    end
end
start_point=[-0.5 0.5];
l=start_point-data_set(1,1:2); 
w_set=[];
f=plot([0 l(1)],[0 l(2)],'-y');
w=[-l(2) l(1)];
h=plot(x,x*w(1)/w(2),'--r');
for i=2:length(data_set)
    w_set=[w_set; w];
    if dot(l,data_set(i,1:2))*data_set(i,3)<0
    %error: the 
        degree=acos(dot(l,data_set(i,1:2))/(sqrt(l*l')+sqrt(data_set(i,1:2)*data_set(i,1:2)')));
       if degree>pi/2
           l=(l+data_set(i,1:2))/2;
       else
           l=(l-data_set(i,1:2))/2;
       end
    end
    pause(0.3);
    delete(h);
    delete(f);
    w=[-l(2) l(1)];
    f=plot([0 w(1)],[0 w(2)],'-y');
    h=plot(x,x*w(1)/w(2),'--r');
end


