function conv=conv_cos(data,conv_kernal_size,conv_kernal_number,conv_kernal_step)
    %data:data matrix
    %conv_kernal_size: the size of kernal
    %conv_kernal_number: the number of kernals
    %conv_kernal_step: the length of each step

    %init the list of conv kernals.
    [im_m,im_n]=size(data);
    conv_list=zeros(conv_kernal_size,conv_kernal_size,conv_kernal_number);
    for i=1:conv_kernal_number
        conv_list(:,:,i)=normrnd(0,1,conv_kernal_size,conv_kernal_size);
    end
    %init details of conv layers.
    conv_size=floor((im_m-conv_kernal_size)/conv_kernal_step+1);
    conv=zeros(conv_size,conv_size,conv_kernal_number);
    %convolution of layer1
    for k=1:conv_kernal_number
        for i=1:conv_size
            for j=1:conv_size
                conv_kernal_dot=data((i-1)*conv_kernal_step+1:(i-1)*conv_kernal_step+conv_kernal_size,(j-1)*conv_kernal_step+1:(j-1)*conv_kernal_step+conv_kernal_size,:).*conv_list(:,:,k);
                sum_res=sum(sum(sum(conv_kernal_dot)))/(conv_kernal_size*conv_kernal_size*3);
                if(sum_res<0)
                    conv(i,j,k)=0;
                else
                    conv(i,j,k)=sum_res;
                end
            end
        end
    end
end
