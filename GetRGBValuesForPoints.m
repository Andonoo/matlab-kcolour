function [RGBValues] = GetRGBValuesForPoints(image_array, points)
% This function takes a 3D image array and a 2D array specifying points within
% the 3D array, and then outputs the RGB values at the given points.
% Inputs: image_array = 3D array representing the RGB values of an image
%       : points = 2D array representing points or 'pixels' in the 3D array
% Output: RGBValues = 3D array with 1 column and 3 layers holding
%                     the RBG values at the given points
% Author: Andrew Donovan

% Finding dimensions of points array
[rows, ~] = size(points);

% Presetting RGBValues array
RGBValues = zeros(rows, 1, 3);

% Using for loop to go through each coordinate in points array and storing
% the values from layers 1 to 3 in layers 1 to 3 of RGBValues array.
for i = 1:rows
    RGBValues(i, 1, :) = image_array((points(i, 1)), (points(i, 2)), :);
end
end



