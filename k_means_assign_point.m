function dataset=k_means_assign_point(dataset,centroid_point)
    for k=1:length(dataset)
        distance_c=dot(dataset(k,2:3)-centroid_point(1,:),dataset(k,2:3)-centroid_point(1,:));
        for l=1:length(centroid_point)
            if dot(dataset(k,2:3)-centroid_point(l,:),dataset(k,2:3)-centroid_point(l,:))<distance_c
                dataset(k,1)=l;
                distance_c=dot(dataset(k,2:3)-centroid_point(l,:),dataset(k,2:3)-centroid_point(l,:));
            end
        end
    end
end