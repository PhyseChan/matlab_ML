amount=500;
dataset=rand(amount,2);
dataset=[ones(amount,1) dataset];
logo='yok^g.r*msbp';
hold on;
% dataset=[46,11;15,38;4,37;12,32;16,38;43,12;11,31;50,21;36,11;17,12;31,15;55,13;30,10;6,30;44,15;36,11;16,33;9,34;2,10;54,12;35,13;43,12;10,36;13,31;56,15;15,14;25,25;51,14;7,37;7,34;34,11;55,11;16,30;19,12;24,32;3,8;34,15;18,12;3,13;10,15;35,16;12,12;54,14;4,39;49,23;7,37;33,32;13,40;34,24;13,37;5,36;38,15;41,31;37,10;2,15;3,13;2,8;47,23;16,12;10,32;45,12;6,14;4,12;31,25;35,14;50,10;7,38;11,34;12,33;8,38;13,34;52,14;13,35;5,4;49,15;9,10;8,12;11,33;56,11;4,35;33,15;56,13;47,24;45,15;25,25;49,14;16,4;27,25;48,12;7,39;20,13;4,32;15,30;45,10;16,14;12,33;6,34;16,13;6,37;37,13;14,37;46,16;35,24;40,12;45,12;10,33;30,31;6,7;46,20;32,11;11,14;18,12;48,16;16,36;29,29;5,32;15,40;7,39;16,6;37,12;33,16;44,14;49,21;33,22;15,5;33,10;14,10;48,10;34,31;2,12;18,9;42,14;48,31;27,20;49,31;16,40;33,31;46,13;31,24;8,39;8,39;26,24;43,11;45,15;17,12;2,8;10,7;42,10;40,15;11,30;43,20;48,12;55,12;35,22;4,30;9,4;4,33;43,14;6,14;37,11;6,32;7,8;35,16;44,14;15,36;8,31;51,15;38,12;23,22;11,33;5,11;16,36;23,32;48,15;55,14;2,7;1,9;44,32;40,11;37,31;20,10;44,26];
% dataset=[ones(182,1) dataset];
K=6;
for j=1:length(dataset)
    plot(dataset(j,2),dataset(j,3),"b^");
end
pause(2)
%init centroid
centroid_point= dataset(unidrnd(amount),2:3);

%use the K-means++ theroy to generate the beginning centroid.

%init others centroid
for k=1:K-1
    %the max distance of centroid and point
    distance_l=0;
    for d_len=1:length(dataset)
        distance_s=10000;
        [c_r,c_c]=size(centroid_point);
        %find out the closet centroid
        for c_i= 1: c_r
           euler_d=norm(dataset(d_len,2:3)-centroid_point(c_i,:));
           if euler_d<distance_s
               distance_s=euler_d;
           end
        end
        %find out the furthest point among the closet set.
        if distance_l<distance_s
            centroid_point(k+1,:)=dataset(d_len,2:3);
            distance_l=distance_s;
        end
    end
end

% assign the point to the cluster
dataset=k_means_assign_point(dataset,centroid_point);
% generate new centroid points
centroid_point=k_means_generate_centroid(dataset,centroid_point);
for j1=1:length(dataset)
        plot(dataset(j1,2),dataset(j1,3),logo(dataset(j1,1)*2-1:dataset(j1,1)*2));
end

for i =1:50
    pause(0.1);
    cla;
    % assign the point to the cluster
    dataset=k_means_assign_point(dataset,centroid_point);
    % generate new centroid points
    centroid_point=k_means_generate_centroid(dataset,centroid_point);
    for j=1:length(dataset)
        plot(dataset(j,2),dataset(j,3),logo(dataset(j,1)*2-1:dataset(j,1)*2));
    end
end

for c= 1:K
    plot(centroid_point(c,1),centroid_point(c,2),'black+')
end

