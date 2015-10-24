function Graph21( )
%GRAPHALL Summary of this function goes here
%   Detailed explanation goes here

theta = [0 0 0];
R2_Finger_Cosines(theta);
hold on

for x = -4:4
    for y= -2:19
        theta = 5*[x y 0];
        R2_Finger_Cosines(theta);
    end
end

