function GraphAll( )
%GRAPHALL Summary of this function goes here
%   Detailed explanation goes here

theta = [0 0 0];
R2_Finger_Cosines(theta);
hold on

for x = 1:12
    theta = [0 0 10*x];
    R2_Finger_Cosines(theta);

end

