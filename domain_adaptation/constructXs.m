function  Xs = constructXs(mouse_sets,mouse_homogene)

m = length(mouse_homogene);
Xs = zeros(m,1);

for i = 1: length(mouse_sets)
    Xs(mouse_sets{i},i) = 1;
end

end

