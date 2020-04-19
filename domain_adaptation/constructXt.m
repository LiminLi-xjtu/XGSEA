function  Xt = constructXt(human_sets,human_homogene)

m = length(human_homogene);
Xt = zeros(m,1);

for i = 1: length(human_sets)
    Xt(human_sets{i},i) = 1;
end

end

