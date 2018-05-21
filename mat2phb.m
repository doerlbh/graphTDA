% dat2mat
% extract persistent homology barcodes from data matrix

% Author:       Baihan Lin
% Affliation:   Rabadan Lab, Columbia University
% Date:         04/2018

function [dist,epsilon,barcode] = mat2phb(dat, h, metric)

N = size(dat, 2);
dist = zeros(N,N);

switch metric
    case 'Euclidean'
        for x = 1:N
            for y = 1:N
                dist(x,y) = sqrt(sum((dat(:,x) - dat(:,y)).^2));
                dist(y,x) = dist(x,y);
            end
        end
    otherwise
        disp('TBA')
end

barcode = [];
switch h
    case 0
        barcode = zeros(N,100);
        max_dist = max(max(dist));
        epsilon = linspace(0,max_dist);
        for t = 1:99
            graph = [dist <= epsilon(t)];
            
            disp(num2str(betti_0));
            betti_0 = int64(N - (sum(sum(graph)) - N) / 2);
            disp(num2str(betti_0));
            barcode(betti_0, t) = 1; 
        end
        
    otherwise
        disp('TBA')
end