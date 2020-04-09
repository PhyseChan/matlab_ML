function res_theta=logreg(dataset,learn_rate,max_iteration,changing_rate)
    [m,n]=size(dataset);
    X=dataset(:,1:n-1);
    X=[ones(m,1) X];
    Y=dataset(:,n);
    theta=zeros(n,1);
    flag=0;
    iterate_time=0;
    while flag==0
        iterate_time=iterate_time+1;
        theta_temp=ones(n,1);
        h_theta=1./(1+exp(-X*theta));
        for i=1:n
            theta_temp(i)=theta(i)-(h_theta-Y)'*X(:,i)*learn_rate/m;
        end
        changing_range=theta./theta_temp;
        if (max(changing_range)<(1+changing_rate) & min(changing_range)>(1-changing_rate)) | iterate_time==max_iteration
            flag=1;
        else
            theta=theta_temp;
        end
    end
    res_theta=theta;
end

