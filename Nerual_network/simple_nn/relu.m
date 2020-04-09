function res=relu(x)
    res=x;
    res(res<0)=0;
end