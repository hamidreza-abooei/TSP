function PlotCities(cities , cost,step)
%PLOTCITIES get a cities path and draw its 3d plot
%   first a (0,0,0) city will be added as an start and end points
    [m n] = size(cities);
    cities = [ zeros(1,n) ;cities ; zeros(1,n)];
    figure();
    plot3(cities(:,1),cities(:,2),cities(:,3),'o-');
    grid on
    str = sprintf("Step = %d , Cost = %.2f" ,step , cost);
    title(str)
%     title (["The first step , cost = "  cost])
end

