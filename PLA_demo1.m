data_set=[
    -1.5 1 1;
    1 1 -1;
    1 5 -1;
    -1 -4 1;
    -1 1.3 1;
    1 4 -1;
    1 2.5 -1;
    -1 -0.7 1;
    2 -1 -1;
    2 1 -1;
    -0.5 -2 1;
    1.8 -2.1 -1;
    1 -4 1;
    -1 4 -1;
    2 -5 1;
    -1.5 2.5 1;

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
w_set=[];
origin=[0 0];
w=data_set(1,1:2)-origin;
hw=plot([0 w(1)],[0 w(2)],'--r');
h=plot(x,-x*w(1)/w(2),'-y');
for test= 1:5
for i = 1: length(data_set)
    ln=origin-data_set(i,1:2);
    dot_product=dot(w,ln);
    pause(0.1)
    if dot_product*data_set(i,3)<=0
        if acos(dot_product*(ln*ln')/(w*w'))>pi/2
            w=w+ln;
        else
            w=w-ln;
        end
    end
    delete(h);
    delete(hw);
    hw=plot([0 w(1)],[0 w(2)],'--r');
    h=plot(x,-x*w(1)/w(2),'-y');
end
end
