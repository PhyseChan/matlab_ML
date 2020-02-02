function centroid_point=generate_centroid(dataset_new,centroid_point)
    for centroid_loop = 1: length(centroid_point)
        [m n]=size(find(dataset_new(:,3)==centroid_loop));
        new_centroid=sum(dataset_new(dataset_new(:,3)==centroid_loop,1:2))./m;
        centroid_point(centroid_loop,1:2)=new_centroid;
    end
end