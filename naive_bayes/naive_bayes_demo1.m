%{x1|1~3} {x2|S=1,M=2,L=3}
test_data=[2,2];
dataset=[
    -1 1 1;
    -1 1 2;
    1 1 2;
    1 1 1 ;
    -1 1 1;
    -1 2 1;
    -1 2 2;
    1 2 2;
    1 2 3;
    1 2 3;
    1 3 3;
    1 3 2 ;
    1 3 2 ;
    1 3 3;
    -1 3 3;
    ];
x1=ones(1,3)*0;
x2=ones(1,3)*0;
z1=zeros(3,2);
z2=zeros(3,2);
[m,n]=size(dataset);
[m1, n1]=size(find(dataset(:,1)==1));
[m_1, n_1]=size(find(dataset(:,1)==-1));
for i=1:m
       x1(1,dataset(i,2))=x1(1,dataset(i,2))+1;
       x2(1,dataset(i,3))=x2(1,dataset(i,3))+1;
       z1(dataset(i,2),(dataset(i,1)+3)/2)=z1(dataset(i,2),(dataset(i,1)+3)/2)+1;
       z2(dataset(i,3),(dataset(i,1)+3)/2)=z2(dataset(i,3),(dataset(i,1)+3)/2)+1;
end
v=(z1(test_data(1,1),:)./[m_1,m1]).*(z2(test_data(1,2),:)./[m_1,m1]);
v=v.*[m_1/m,m1/m];
disp(v);
