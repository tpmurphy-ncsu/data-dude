%Taylor Murphy
%Project 3: Introduction to Scientific Programming

clear; close all; clc;
%% Step 1 
%Loading the input data

load input_data.mat

[n,N] = size(V);%document the number of rows(n) and colomns(N) for later indexing
%% Step 2
%Ask the user to enter the number of clusters "k"

k= input('Please enter your desired number of data clusters:\n');
%% Step 3
%Initialize cluster centers

C = [3.5, 3.5 ,9.0,9.5;1.5,.5,-.5,-.5];%Initialize specified cluster centers 

for T=1:100
%% Step 4
%Compute the distance
  d_ij = my_distance(C,V);%calculate the distance from each point to each cluster center

%% Step 5
%For each j, assign the data point

%Preallocate the variables to be used in the for loops below
    m = NaN(1,N);% m will indicate which cluster center each point belongs to 
    a = NaN(1,N);% a indicates the value of the distance and will not be used
    z = zeros(1,k);% z is a counter of elements in each cluster center
    s = zeros(2,k);% s is the sum of elements in said cluster center and will be used to recalculate the new centers
    
    for i=1:N
        [a(i),m(i)] = min(d_ij(:,i));  %Note min value(a) and location(M) for each distance value
        
        for j=1:k
            if m(i)==j   %create a count of points that belong to each center
               z(j)=z(j)+1; %increase count if it belongs to that center(j)
               s(:,j) = s(:,j) + V(:,i);%add to the sum of the x for that center
            end
        end
    end
%% Step 6
%Update Cluster Centers 

    for i=1:k                      %Goes through centers one by one
         C(:,i)= s(:,i)./z(i);     %Uses the specified formula to recalculate C
    end

end
%% Plot
%plot the data corresponding to each cluster center

hold on
plot(V(1,m==1),V(2,m==1),'.r')
plot(V(1,m==2),V(2,m==2),'.b')
plot(V(1,m==3),V(2,m==3),'.k')
plot(V(1,m==4),V(2,m==4),'.g')

     axis equal
     axis ([-1 11 -1 2])%set the axis boundaries to what is specified 



