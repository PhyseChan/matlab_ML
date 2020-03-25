hold on;
[m n]= size(heartdisease);
% regularize the data whose boundary is far over than others.
mean_matrix=ones(m,1)*mean(heartdisease);
max_min_difference_matrix=ones(m,1)*(max(heartdisease)-min(heartdisease));
heart_disease_dataset=(heartdisease-mean_matrix)./max_min_difference_matrix;
index=round(m*0.7);

%separate the dataset into test data and training data
X=[ones(index,1) heart_disease_dataset(1:index,1:n-1)];
Y=heartdisease(1:index,n);
X_t=[ones(m-index,1) heart_disease_dataset(index+1:m,1:n-1)];
Y_t=heartdisease(index+1:m,n);

%learning rate & theta vector
alpha=0.001;
theta=zeros(n,1);
theta_temp=zeros(n,1);
flag=1;
j=0;
max_iteration=300000;
%gradient descent
while flag==1
    h_theta=1./(1+exp(-X*theta));
    j=j+1;
    for i= 1:n
        gradient_val=((h_theta-Y)'*X(:,i))*alpha/index;
        theta_temp(i)=theta(i)-gradient_val;
    end
    changing_rate=theta./theta_temp;
    if ((max(changing_rate)<1.0001) & (min(changing_rate)>0.9999))| j==max_iteration
        flag=0;
    end
    theta=theta_temp;
    plot(j/10,-(Y'*log(h_theta)+(1-Y)'*log(1-h_theta))/index,'k.');
end

test_h_theta=1./(1+exp(-X_t*theta));
test_result=(test_h_theta>=0.5);
accuracy=sum(sum(((test_result-Y_t)==0)))/index;
disp(accuracy);





