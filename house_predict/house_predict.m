hold on;
test_set=datarent(4221:6031,:);
training_set=datarent(1:4221,:);
X=training_set(:,1:11);
X=[ones(4221,1) X];
Y=training_set(:,12);

X_t=test_set(:,1:11);
X_t=[ones(1811,1) X_t];
Y_t=test_set(:,12);

[m,n]=size(X);
theta= zeros(12,1);
theta_temp=zeros(12,1);
alpha=0.0005;
flag=1;
j=0;
while flag==1
    j=j+1;
    res=dot((X*theta-Y),(X*theta-Y));
    for i=1:n
        theta_temp(i)=theta(i)-alpha*(X*theta-Y)'*X(:,i)/m;
    end
    rate=theta./theta_temp;
    if theta==theta_temp|max(rate)<1.00001&min(rate)>0.99999|j==150000
        flag=0;
    else
        theta=theta_temp;
    end
    plot(j/100,(X*theta-Y)'*(X*theta-Y)/24,'k.')
end
disp(theta);
