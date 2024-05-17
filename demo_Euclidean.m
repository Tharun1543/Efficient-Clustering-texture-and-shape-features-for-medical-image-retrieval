clear
close all
clc

% Number of images in the database
M = 100;
query_images = cell(1, M);
%image_folder = ''; 
% Update this loop to read images from your new database
for i = 1:M
    % Replace 'OASIS Images' with the path to your image folder
    % Ensure proper file path formatting using filesep()
    filename = fullfile('OASIS Images', [int2str(i), '.gif']);
    query_images{i} = imread(filename);
end

% Assuming the first query image is query_images{1}
query_image1 = query_images{1};

% Calculate Euclidean distance between the first query image and each database image
for i = 2:M
    % Compute Euclidean distance
    d1 = sqrt(sum((double(query_image1(:)) - double(query_images{i}(:))).^2));
    
    % Display distances for each iteration
    fprintf('Distance between query image 1 and database image %d: %.2f\n', i, d1);
end
