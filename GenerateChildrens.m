function childrens = GenerateChildrens(parents, parents_cost,approach)
%GENERATECHILDRENS this function gets parents and generate childrens
%   
    
    children_number = 10;
    [r, c] = size(parents);
    childrens = zeros(r,children_number);

%     parents_cost = 1 ./ parents_cost; % this is another way 
if (approach == 1)
    parents_cost = max(parents_cost) - parents_cost + 1 ; % +1 is for the situation that every costs are equal to avoid /0
    accumulate_cost = sum(parents_cost);
    parents_probability = parents_cost / accumulate_cost;
    [max_p,index] = max(parents_probability);
    for i = 1:children_number
        selected_sequence = zeros(1,r);
        p = rand(1,r);
        selected = 0;
        probs = 0;
        for j = parents_probability
            selected = selected + 1;
            selected_sequence = selected_sequence + ( (p > probs) & (p <= probs + j) ) * selected;
            probs = probs + j;
        end
        
        
        new_child = (selected_sequence == index) .* transpose(parents(:,index)) ;
        counter = 1;
        for j = selected_sequence
            if (j ~= index)
                for k = transpose(parents(:,j))
                    if (~any(new_child == k))
                        new_child(counter) = k;
                        break;
                    end
                end
            end
            counter = counter + 1;
        end
        
        % Mutation 
        random_number = randi([1,r],1,2);
        temp = new_child(random_number(1));
        new_child(random_number(1)) = new_child(random_number(2));
        new_child(random_number(2)) = temp;
        
        
        childrens(:,i) = new_child';
        
    end
elseif (approach == 2)
    for i = 1:children_number
        [max_p,index] = min(parents_cost);
        break_points = randi([1,r],1,2);
        new_child = parents(:,index);
        new_child(min(break_points):max(break_points)) = flip (new_child(min(break_points):max(break_points)));
        parents(:,index) = [];
        parents_cost(index) = [];
        
        % Mutation 
        random_number = randi([1,r],1,2);
        temp = new_child(random_number(1));
        new_child(random_number(1)) = new_child(random_number(2));
        new_child(random_number(2)) = temp;
        
        
        childrens(:,i) = new_child';
    end
end

end

