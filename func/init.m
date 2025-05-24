function [A, B] = init(data, clusters, anchor_num)
    idx = KmeansppInitialize(data',  anchor_num);
    B = create_indicator_matrix(idx, anchor_num);          
    centroids = getCenter(B,data');
    
    A0 = selftuning(centroids, clusters);
    F_init = n2hi(A0, clusters);
    A = create_indicator_matrix(F_init,clusters);
    
    
    B=B*diag(1./sum(B,1));
end