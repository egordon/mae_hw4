function Graph22( )
%GRAPHALL Summary of this function goes here
%   Detailed explanation goes here

theta = [0 0 0];
R2_Finger_Cosines(theta);
hold on

for x = 1:24
    theta = [0 0 5*x];
    R2_Finger_Cosines(theta);

end

