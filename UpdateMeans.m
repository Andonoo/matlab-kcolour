function [mean_values] = UpdateMeans(image_array,k, cluster_assignments)
% This function takes a 3D array representing an RBG image, a set number of
% clusters, and the assignment of pixels within the RGB to these clusters
% within a 2D array. It then calculates the mean red, green and blue values
% for each cluster.
% Inputs: image_array = 3D array representing the RGB values of an image.
%       : k = number of clusters in the image.
%       : cluster_assignments = 2D array containing each pixel's cluster
%                               assignment.
% Output: mean_values = 3D array with k rows, 1 column and 3 layers containing
%                       the mean red, green and blue values for each cluster.
% Author: Andrew Donovan

% Presetting array which will contain mean values for each colour, for each
% cluster
mean_values = zeros(k, 1, 3);

% Getting dimensions of image array
[r, c, ~] = size(image_array);

% Using for loop to address each cluster at a time.
for cluster = 1:k
    % Finding each pixel assigned to the given cluster and storing
    % the coordinates of these pixels in two variables (rows and cols)
    [rows, cols] = find(cluster_assignments==cluster);
    % Finding the indices of these coordinates in the first layer (red) of the
    % image array. With these we can find the equivalent indices of the 2nd
    % (green) and 3rd (blue) layers by adding the number of values in a whole
    % layer (number of rows x number of columns)
    red_indices = sub2ind(size(image_array), rows, cols);
    green_indices = red_indices + (r*c);
    blue_indices = green_indices + (r*c);
    % Finding the values at the found indices (coordinates) and storing
    % them in a different variable for each colour
    colour_values_red = image_array(red_indices);
    colour_values_green = image_array(green_indices);
    colour_values_blue = image_array(blue_indices);
    % Finding the mean for each colour of this cluster and storing this
    % mean in the appropriate position of the mean_values output array.
    mean_values(cluster, 1, 1) = mean(colour_values_red);
    mean_values(cluster, 1, 2) = mean(colour_values_green);
    mean_values(cluster, 1, 3) = mean(colour_values_blue);
end
end