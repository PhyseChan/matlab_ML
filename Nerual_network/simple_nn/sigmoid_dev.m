function  res = sigmoid_dev(x,theta)
    res=sigmoid(x,theta).*(1-sigmoid(x,theta));
end

