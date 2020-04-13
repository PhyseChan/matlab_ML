%trans uint8 to double type.
data=imread('jyashin.jpg');
data=im2double(data);
[im_m,im_n]=size(data);

conv_mat=conv_cos(data,5,8,2);
pool_mat=pooling(conv_mat,2);


conv_mat_2=conv_cos(pool_mat,5,10,3);
pool_mat_2=pooling(conv_mat_2,2);

for i=1:10
    subplot(2,5,i);
    imshow(pool_mat_2(:,:,i));
end

