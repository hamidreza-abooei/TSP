function dist = CalculateDist(city1,city2)
%CALCULATEDIST calcutates the distance between city1 and city2
%   this function uses Euclidean distance

dist = sum((city1 - city2).^2);

end

