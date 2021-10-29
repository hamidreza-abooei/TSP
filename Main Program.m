clear
close all
clc 
%% Some initialization
number_of_cities = 25;
number_of_parents = 20;
number_of_parents_in_next_generation = 10;
number_of_iteration = 1000    ;
approach = 1;  % first approach: 1 , second approach: 2

% dimention = 3        % This dimention can be used if the range of each
% dimenttion is the same 

%%  Generate cities
cities = GenerateCities(number_of_cities);

%% Generate initial parents
parents = GenerateParents(number_of_cities, number_of_parents);

%% Generate next generation 
next_generation = parents;
plot_steps = [1,100 , 500 , 1000 , 2000 , 3000 , 4000 , 5000 , 7000 , 10000, 100000 , 1000000];
mean_cost = zeros(1,number_of_iteration);
least_cost = zeros(1,number_of_iteration);

for i = 1:number_of_iteration
    [next_generation,next_generation_cost ] = NextGeneration(cities , next_generation , number_of_parents_in_next_generation,approach);
    least_cost(i) = min(next_generation_cost);
    mean_cost(i) = mean(next_generation_cost);
%     min(next_generation_cost)
    if (any(plot_steps == i))
        disp(i)
        [minimum ,index] = min(next_generation_cost);
        PlotCities(cities(next_generation(:,index),:),minimum , i);
    end
end

%% Plot the trend
figure();
plot(least_cost , "r");
hold on ;
plot (mean_cost,"b");
legend("Least cost" , "mean cost");

