clear
close all
clc

% Number of images in the database
M = 100;
query_images = cell(1, M);

% Update this loop to read images from your new database
for i = 1:M
    % Replace 'OASIS Images' with the path to your image folder
    % Ensure proper file path formatting using filesep()
    filename = fullfile('OASIS Images', [int2str(i), '.gif']);
    query_images{i} = imread(filename);
end

% Assuming the first query image is query_images{1}
query_image1 = double(query_images{1});

% Calculate Canberra distance between the first query image and each database image
for i = 2:M
    % Convert database image to double for calculations
    database_image = double(query_images{i});
    
    % Compute Canberra distance
    d = canberra_distance(query_image1(:), database_image(:));
    
    % Display distances for each iteration
    fprintf('Canberra distance between query image 1 and database image %d: %.2f\n', i, d);
end

% Define Canberra distance function
function distance = canberra_distance(x, y)
    % Check if inputs have the same size
    if numel(x) ~= numel(y)
        error('Inputs must have the same size');
    end
    
    % Calculate Canberra distance
    numerator = abs(x - y);
    denominator = abs(x) + abs(y);
    
    % Avoid division by zero
    denominator(denominator == 0) = eps;
    
    % Compute distance
    distance = sum(numerator ./ denominator);
end
