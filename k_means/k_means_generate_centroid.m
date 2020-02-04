function centroid_point=k_means_generate_centroid(dataset,centroid_point)
   %calculate the centroid of the cluster.
    for i=1:length(centroid_point)
       centroid_point_new=[0 0];
       for j=1:length(dataset)
           if dataset(j,1)==i
               centroid_point_new=centroid_point_new+dataset(j,2:3);
           end
       end
       [m n]=size(find(dataset(:,1)==i));
       centroid_point_new=centroid_point_new/m;
       centroid_point(i,:)=centroid_point_new;
    end
end