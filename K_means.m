dataset=[
    1 1;
    5 1;
    4 4
    ];
point=[3 3];
sum_distance=0;
for i = 1:length(dataset)
    v1=(dataset(i)-point);
    distance=dot(v1,v1)^(1/2);
    sum_distance=distance+sum_distance;
end
distance_mean=(sum_distance/length(dataset));
disp(distance_mean);