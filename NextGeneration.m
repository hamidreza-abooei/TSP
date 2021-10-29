function [next_generation,next_generation_cost] = NextGeneration(cities,parents,number_of_parents_in_next_generation,approach)
%NEXTGENERATION generate next generation 
%   
    [m, n] = size(parents);
    parents_costs = zeros(1,n);
    for i = 1:n
        parents_costs(i) = CalcCost(cities(parents(:,i)));
    end

    next_generation = GenerateChildrens(parents, parents_costs,approach);
    next_generation = [zeros(m,number_of_parents_in_next_generation) next_generation ];
    [m, n] = size(next_generation);
    next_generation_cost = zeros(1,n);
    for i = 1: number_of_parents_in_next_generation
        [minimum, index] = min(parents_costs);
        next_generation(:,i) = parents(:,index);
%         next_generation_cost(i) = maximum;
        parents(:,index) = [];
        parents_costs(index) = [];
    end 

    for i = 1:n
        next_generation_cost(i) = CalcCost(cities(next_generation(:,i)));
    end
        

end

