function [cluster_assignments,mean_values] = KMeansRGB(image_array,seed_means,MaxI)
% This function uses the k-means algorithm to partition points in an image
% into clusters. It does this through calling the AssignToClusters and
% UpdateMeans functions until the mean colour values for each cluster stop
% changing (when the algorithm has converged) or when the maximum number of
% specified iterations is reached.
% Inputs: image_array = 3D array representing the RGB values of the image.
%       : seed_means =  3D array containing the mean values used to begin
%                       the algorithm.
%       : MaxI = maximum number of interations the function will run before
%                stopping without convergence.
% Outputs: cluster_assignments = 2D array containing information on which
%                                cluster each pixel in the image is assigned to.
%        : mean_values = 3D array containing the mean values of each cluster after
%                        either convergence or the maximum number of iterations
%                        has been reached.
% Author: Andrew Donovan

% Retrieving number of clusters (k)
[k, ~, ~] = size(seed_means);

% Setting initial number of iterations (I) and initial mean values
I = 0;
mean_values_temp = seed_means;
mean_values = [];

% Using while loop to repeat the cluster assignment and update means steps
% until either convergence (mean_values = mean_values_temp) or the max
% iterations is reached
while (isequal(mean_values, mean_values_temp) == 0) && (I<MaxI)
    % Updating the mean_values after iteration
    mean_values = mean_values_temp;
    % Calling AssignToClusters function to update the cluster assignments of each
    % pixel in the image
    cluster_assignments = AssignToClusters(image_array, mean_values_temp);
    % Calling the UpdateMeans function to update the RGB means for each
    % cluster
    mean_values_temp = UpdateMeans(image_array, k, cluster_assignments);
    I = I + 1;
end

% Testing whether convergence was reached and displaying a warning message
% if it was not
if (isequal(mean_values, mean_values_temp) == 0)
    disp('Maximum number of iterations reached before convergence was achieved');
end

% Updating the mean_values after convergence or maximum number of
% iterations is reached
mean_values = mean_values_temp;
end
