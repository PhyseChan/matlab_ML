%trans uint8 to double type.
data=imread('jyashin.jpg');
data=im2double(data);
[im_m,im_n]=size(data);
%init details of conv1 kernals.
conv1_kernal_size=5;
conv1_kernal_number=8;
conv1_kernal_step=2;
%init the list of conv1 kernals.
conv1_list=zeros(conv1_kernal_size,conv1_kernal_size,conv1_kernal_number);
for i=1:conv1_kernal_number
    conv1_list(:,:,i)=rand(conv1_kernal_size,conv1_kernal_size);
end
%init details of conv1 layers.
conv1_size=floor((im_m-conv1_kernal_size)/conv1_kernal_step+1);
conv1=zeros(conv1_size,conv1_size,conv1_kernal_number);

%init the pooling kernal1
pool1_kernal_size=2;
pooling1_size=floor(conv1_size/pool1_kernal_size);
pool1=zeros(pooling1_size,pooling1_size,conv1_kernal_number);
%convolution of layer1
for k=1:conv1_kernal_number
    for i=1:conv1_size
        for j=1:conv1_size
            conv1_kernal_dot=data((i-1)*conv1_kernal_step+1:(i-1)*conv1_kernal_step+conv1_kernal_size,(j-1)*conv1_kernal_step+1:(j-1)*conv1_kernal_step+conv1_kernal_size,:).*conv1_list(:,:,k);
            conv1(i,j,k)=sum(sum(sum(conv1_kernal_dot)))/(conv1_kernal_size*conv1_kernal_size*3);
        end
    end
end

%pooling layer1
for k=1:conv1_kernal_number
    for i=1:pooling1_size
        for j=1:pooling1_size
            pool1(i,j,k)=max(max(conv1((i-1)*pool1_kernal_size+1:i*pool1_kernal_size,(j-1)*pool1_kernal_size+1:j*pool1_kernal_size,k)));
        end
    end
end


