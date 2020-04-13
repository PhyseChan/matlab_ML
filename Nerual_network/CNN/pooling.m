function pool=pooling(conv,pool_kernal_size)
    %conv: convolution layer matrix
    %pool_kernal_size: size of pooling kernal
    %conv_kernal_number: number of pervious convolution kernal
    [conv_size,conv_size_n,conv_kernal_number]=size(conv);
    pooling_size=floor(conv_size/pool_kernal_size);
    pool=zeros(pooling_size,pooling_size,conv_kernal_number);
    %pooling layer1
    for k=1:conv_kernal_number
        for i=1:pooling_size
            for j=1:pooling_size
                pool(i,j,k)=max(max(conv((i-1)*pool_kernal_size+1:i*pool_kernal_size,(j-1)*pool_kernal_size+1:j*pool_kernal_size,k)));
            end
        end
    end
end