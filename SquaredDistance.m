function [square_distance] = SquaredDistance(P,Q)
% This function takes two arrays representing points within a 3D array, and finds
% the square distance between them.
% Inputs: P = array containing coordinates of the first point
%       : Q = array containing coordinates of the second point
% Output: square_distance = square distance between the two points
% Author: Andrew Donovan

% Applying formula to calculate square_distance given the 3 coordinates of
% each point. Note due to linear indexing, the result will be equal
% regardless of the format in which the coordinates are input.
square_distance = (P(1) - Q(1))^2 + (P(2) - Q(2))^2 + (P(3) - Q(3))^2;




