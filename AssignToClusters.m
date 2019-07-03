function [cluster_assignments] = AssignToClusters(image_array,RGBValues)
% This function takes a 3D array representing an RGB image, and a 2D array
% containing the RGB values of a number of points within that image. It then
% assigns every point or 'pixel' in the 3D image array to the closest one of the
% points in the RGBValues array.
% Inputs: image_array = 3D array representing the RGB values of an image.
%       : RGBValues = 3D array containing the RBG values at given points
%                     within the image.
% Output: cluster_assignments = 2D array containing information on which
%                               point each 'pixel' in the image array is
%                               assigned to.
% Author: Andrew Donovan

% Getting needed dimensions of the image array and RGBValues array
[rows, cols, ~] = size(image_array);
[rowsRGB, ~, ~] = size(RGBValues);

% Presetting array which will contain the distance information between
% each pixel and the RGBValues
all_distances = zeros(rows, cols, rowsRGB);

% Using for loop to address each point in the RGBValues array one at a time
for i = 1:rowsRGB
    % Retrieving each the points RGB values and storing them in variable, Q
    Q = RGBValues(i, 1, :);
    % Applying the squared distance formula to the entire image with the
    % given point. Storing these distances in an array, all_distances. Each
    % layer in this array will represent the distances to the corresponding
    % point
    all_distances(:, :, i) = (image_array(:, :, 1) - Q(1)).^2 + (image_array(:, :, 2) - Q(2)).^2 + (image_array(:, :, 3) - Q(3)).^2;
end

% For each pixel in the image, finding the smallest distance and storing the
% number of the corresponding point in the cluster_assignments array
[~, cluster_assignments] = min(all_distances, [], 3);

end