function parentCities = GenerateParents( number_of_cities, number_of_parents )
%GENERATEPARENTS get one parent and generate 2 other parents 
%   3d matrix will be returned
parentCities = zeros(number_of_cities, number_of_parents);
for i = 1:number_of_parents
    parentCities(:,i) = randperm(number_of_cities);
end 


end

