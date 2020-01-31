data_set=[
    3 3 1 1;
    4 3 1 2;
    1 1 -1 3;
];
hold on;
axis([-6 6 -6 6]);
axis equal;
grid on;
grid minor;
point_symbol=['o';'*'];
x=linspace(-6,6);
[r,c]=size(data_set);
for l=1: r
    plot(data_set(l,1),data_set(l,2),point_symbol((data_set(l,3)+3)/2))
end

w=[0 0];
b=0;
flag=1;
i=1;
count=[];
learning_rate=0.5;
w_list=[];
% while flag
hs=plot(0,0);
hf=plot(0,0);
while flag==1
    pause(0.5);
    delete(hs);
    delete(hf);
    h=w*data_set(i,1:2)'+b;
    if h*data_set(i,3)<=0
        w=w+data_set(i,1:2)*data_set(i,3)*learning_rate;
        b=b+learning_rate*data_set(i,3);
        w_list=[w_list;w data_set(i,4) b];
        if any(count==i)
            count(count==i)=[];
        end
    else
        count(i)=i;
    end
    hs=plot([0 w(1)],[0 w(2)],'--r');
    hf=plot(x,(-x*w(1)-b)/w(2),'-b');
    i=mod(i+1,3)+1;
    if length(count)==r
        flag=0;
    end
end
%         if count~=0
%             count=count-1;
%         end
%     else
%         count=count+1;
%     end
%     i=mod(i+1,3)+1;
%     if count==3
%         flag=0;
%     end
% end

