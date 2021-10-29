function cost = CalcCost(cities)
%CALCCOST function gets cities positions in order, and then calculate the
%total distance (cost) 
%   This function added a city in (0 ,0 ,0) to the fist and last of cities
%   that is the city that the salesman started and returned
    [m, n] = size(cities);
    cities = [ zeros(1,n) ;cities ; zeros(1,n)];
    dists = zeros(length(cities)-1 , 1);
    for i = 1:length(cities) - 1
        cost = CalculateDist(cities(i,:),cities(i+1,:));
        dists(i) = cost ;
    end
    cost = sum(dists);
end

