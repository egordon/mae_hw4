function Graph23( )
%GRAPHALL Summary of this function goes here
%   Detailed explanation goes here

theta = [0 0 0];
R2_Finger_Cosines(theta);
hold on
    
for y = -1:9
    for z = 0:12
        theta = 10*[0 y z];
        R2_Finger_Cosines(theta);
    end
end

