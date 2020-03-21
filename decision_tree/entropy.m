function y=entropy(m)
    [r,c]=size(m);
    entr=0;
    pnode=1;
    for i=1:c
        typea=0;
        typeb=0;
        typec=0;
        for j=1:r
            if m(j,5)==1
                typea=typea+1;
            elseif m(j,5)==2
                typeb=typeb+1;
            else
                typec=typec+1;
            end
        end
        sum=typea+typec+typeb;
        temp=-typea*log2(typea)/sum-typeb*log2(typeb)/sum-typec*log2(typec)/sum;
        if temp>entr
           pnode=i;
        end
     end
end
