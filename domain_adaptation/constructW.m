

function [W,Wss,Wst,Wtt] = constructW(mouse_sets,human_sets,mouse_homogene,human_homogene,G)

Wss = constructWss(mouse_sets,mouse_homogene);
Wst = constructWst(mouse_sets,human_sets,G);
Wtt = constructWss(human_sets,human_homogene);
W = [Wss Wst;Wst' Wtt];

end