function res= 2by2nn(theta1,theta2,input)
    res=sigmoid(sigmoid(input*theta1)*theta2);
end

