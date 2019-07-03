function [points] = SelectKRandomPoints(image_array,k)
% This function takes a 3D image array and randomly selects a given number
% (k) of 'pixels' within that 3D array.
% Inputs: image_array = 3D array representing the image
%       : k = number of randomly selected points required
% Output: points = array containing the location coordinates of the randomly
%         selected points
% Author: Andrew Donovan

% Finding dimensions of the image array.
[rows, cols, ~] = size(image_array);

% Randomly selecting k numbers between 1 and the number of possible
% locations and storing them in variable 'locations'.
locations = randperm((rows*cols), k);

% Preallocating variable to hold output points
points = zeros(k, 2);

% Using ind2sub function to find the row-column indices of these
% random locations and storing these coordinates in the output variable.
[points(:,1), points(:,2)] = ind2sub([rows, cols], locations);
end
