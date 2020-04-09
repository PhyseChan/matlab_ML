
clear
N=29; %样本对数
M=6; %隐层神经元个数
i=[0:N];
x1=2*pi*i/20; %输入样本
x=[linspace(-1,-1,N+1);x1]; %输入样本与阈值合成的输入，第一行为阈值的输入（恒为-1），第二行为实际的输入样本
t=0.5*(1+cos(x1)); %目标输出
w1=rand(M+1,2);%初始化输入层到隐层的权值
w2=rand(1,M+1);%初始化隐层到输出层的权值
o(1,1:N+1)=-1;%到输出层的阈值的输入（恒为-1）
n=0.09; %学习率
eset=0.035; %设定期望精度
pmax=99999999999; %最大学习次数
for p=1:pmax
    NETh=w1*x;

    o=1./(1+exp(-NETh));%隐层输出

   
    NETo=w2*o;

    y=1./(1+exp(-NETo));%输出层输出

   
    %权值调整 w2,w1
    e=0.5*(y-t)*(y-t)'; %计算误差
    if (e<eset) %当误差达到精度时结束权值调整
        break;
    end
   
    delta2=(t-y).*y.*(1-y);
    w2=w2+n*delta2*o';%隐层到输出层的权值调整
    delta1=o.*(1-o).*(w2'*delta2);
    w1=w1+n*delta1*x';  %输入层到隐层的权值调整
end
        
%结果计算
NETh=w1*x;
for j=1:N+1
    for i=2:M+1
            o(i,j)=1/(1+exp(-NETh(i,j)));%隐层输出
    end
end
NETo=w2*o;
for j=1:N+1
    y(1,j)=1/(1+exp(-NETo(1,j)));%输出层输出
end
p %学习次数显示
plot(x1,t,'r',x1,y,'b')