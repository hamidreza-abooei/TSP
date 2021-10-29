function cities = GenerateCities(number_of_cities)
%GENERATECITIES Generate cities
%   According to the question, we have 3 dimention data
    X = random('Uniform',0,3,number_of_cities,1);
    Y = random('Uniform',0,4,number_of_cities,1);
    Z = random('Uniform',0,5,number_of_cities,1);
    cities = [X Y Z];

end

