function W = constructWss(mouse_sets,mouse_homogene)

m = length(mouse_homogene);
X = zeros(m,1);

for i = 1: length(mouse_sets)
    X(mouse_sets{i},i) = 1;
    mlen(i) = length(mouse_sets{i});                                                 
end

A = X'*X;
B = repmat(mlen',1,length(mouse_sets));
C = max(B,B');
W = A./C;     
          

end