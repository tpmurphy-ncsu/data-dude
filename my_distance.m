%Taylor Murphy
%Project 3: Introduction to Scientific Programming
%%
function [Distance] = my_distance(Centers,Data)
%Description:         using the Euclidean distance formula compute the distances
                      %from each point in "Data" to each colomn of Centers data
%inputs: Centers,Data
%outputs: Distance

%Centers:    an input matrix containing the initial centers for the clustering 
%Data:       an input file of data points to be clustered
%Distance:   an output matrix with the rows corresponding to different... 
             %centers and colomns corresponding to different data points

[n,N]= size(Centers);%find the number of rows 


for i=1:length(Centers)
    for j=1:length(Data)
        S=0;             %Reinitialize S for each new distance calculation
        for k=1:n
            S = S + (Data(k,j)-Centers(k,i)).^2;
        end
        Distance(i,j) = sqrt(S);
    end
end
end