
function corr_value = shufflecorr(EXP,y,num_permutation)

B = num_permutation;
m = length(y);
b = arrayfun(@(x)randperm(m),(1:B)','UniformOutput',0);
b = cell2mat(b)';
Y = [y y(b)];

corr_value = corr(EXP',Y);

end
