function dataset_new=assign_point(dataset,dataset_new,centroid_point)
    for k=1:length(dataset)
        distance_c=dot(dataset(k,:)-centroid_point(1,:),dataset(k,:)-centroid_point(1,:));
        for l=1:length(centroid_point)
            if dot(dataset(k,:)-centroid_point(l,:),dataset(k,:)-centroid_point(l,:))<distance_c
                dataset_new(k,3)=l;
                distance_c=dot(dataset(k,:)-centroid_point(l,:),dataset(k,:)-centroid_point(l,:));
            end
        end
    end
end