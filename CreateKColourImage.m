function [KColourImage] = CreateKColourImage(cluster_assignments,mean_values)
% This function takes a 2D array specifying the assignment of pixels in an image
% to given clusters and the RGB colour values for each of these clusters.
% The function then takes these two inputs and produces a 3D array
% representing an image where each pixel is coloured according the the
% information contained in the two inputs.
% Inputs: cluster_assignments = 2D array specifying which cluster each
%                               pixel is assigned to.
%       : mean_values = 3D array specifying the RGB colour values for each
%                       cluster.
% Output: KColourImage = 3D array of unsigned 8 bit integers representing
%                        an RGB image.
% Author: Andrew Donovan

% Rounding mean_values array
mean_values = round(mean_values);

% Getting dimensions of cluster_assignments array
[rows, cols] = size(cluster_assignments);

% Presetting KColourImageArray
KColourImage = zeros(rows, cols, 3, 'uint8');

% Using for loop to address each cluster at a time, then going through each
% 'pixel' in the cluster_assignments array. If the pixel is assigned to
% the given cluster then the corresponding pixel in the KColourImage array is
% set to the RGB value of that cluster
for cluster = 1:length(mean_values)
    for row = 1:rows
        for col = 1:cols
            if cluster_assignments(row, col) == cluster
                KColourImage(row, col, :) = mean_values(cluster, 1, :);
            end
        end
    end
end

end

