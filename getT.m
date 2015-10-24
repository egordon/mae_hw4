function T = getT(l, alph, theta)
%GETT Returns D-H matrix of joint at given angle and distance.

Z = [   cosd(theta) -sind(theta) 0   0;
        sind(theta) cosd(theta) 0   0;
        0           0           1   0;
        0           0           0   1;];
    
X = [   1   0           0           l;
        0   cosd(alph)  -sind(alph) 0;
        0   sind(alph)  cosd(alph)  0;
        0   0           0           1;];
    
T = Z * X;
    
end

