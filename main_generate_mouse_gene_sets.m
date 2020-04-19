

function  main_generate_mouse_gene_sets

clear
load ./data/original_data/HomologyData G
load ./data/original_data/human_gene_sets human_gene_sets_ID

k = 1;
for i = 1:length(human_gene_sets_ID)
    
    human_id = human_gene_sets_ID{i};
    hl(i) = length(human_id);
    net_temp = G(:,human_id);
    snet = sum(net_temp,2);
    mouse_id = find(snet~=0);
    ml(i) = length(mouse_id);
    if length(mouse_id)>=2
        mouse_gene_sets_ID{k} = mouse_id;
        k = k+1;
    end
        
end

save ./data/mouse_gene_sets mouse_gene_sets_ID

end




