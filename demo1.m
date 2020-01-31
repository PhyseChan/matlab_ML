data_set=[
    1 2 1;
    1.2 1 1;
    2.2 3 1;
    2 4 1;
    2.8 1 -1;
    3 4 -1;
    4 1.2 -1;
    4.5 2.8 -1
];

hold on;
axis([0 6 0 6]);
grid on;
grid minor;
grid equal;

flag=0;
w=[1 1];

while flag==0
    for i=1:length(data_set)
        res=data_set(i,[1,2])*w';
        if (res>0 && data_set(i,3)==-1) || (res<0 && data_set(i,3)==1)
            
        end
    end
end

