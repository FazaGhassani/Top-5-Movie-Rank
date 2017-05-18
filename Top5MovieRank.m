function [] = Top5MovieRank(ratings,items)
%faza ghassani
%github : github.com/FazaGhassani

%====================================================================================
%input movie name
namaMovie1 = input('masukan nama movie: ','s');
disp('memproses...');

%searching in items and take the id and put that id to id1
k = 1;
for i=1:length(items)
    if (strcmp(items{k,i},namaMovie1))
        id1 = i;
        %disp(['id untuk ',namaMovie1,':']); disp(id1);
    end
end

%input rating list with id1
rayid1 = ratings(rowsid1,:);

%loop all id movie towards id1 
%except that id1 itself
a = []; b=[]; col=1;
for i=1:length(items)
    if(i~=id1) %if i != movie id1
        rowsid2 = find(ratings(:,2)==i);
        rayid2 = ratings(rowsid2,:);
        
        rateboth = 0;
        rateone = 0;
        for k=1:943
            if(find(rayid1(:,1)==k))
                if (find(rayid2(:,1)==k))
                    rateboth = rateboth + 1;
                else
                    rateone = rateone + 1;
                end
            else if(find(rayid2(:,1)==k))
                if(find(rayid1(:,1)==k))
                    rateboth = rateboth + 1;
                else
                    rateone =  rateone + 1;
                end
                end
            end
        end
        jaccard = rateboth/rateone;
        
        %put to top 5 list
        if (length(a)<5)
            a(1,col) = jaccard;
            b(1,col) = i;
            col=col+1;
        else if (length(a)==5)
           if(a(1,find(a(1,:)==min(a))) < jaccard)
               b(1,find(a(1,:)==min(a)))=i; 
               a(1,find(a(1,:)==min(a)))=jaccard;
           end
            end   
        end
    end
end
disp('selesai!!');

%shows top 5 movies
for i=1:length(b)
    disp(items{b(1,i)});
end
    disp(a);
end

