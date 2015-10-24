function theta4 = R2_Finger( theta )
%R2_FINGER Takes 4 angles, plots the X-Y, X-Z output of the finger.
%   Uses theta vector to construct D-H matrices.

% Load Constants
load('const.mat');

p3 = 0.259;
d4 = 0.162;
dp = 1.062;
j43 = 1.2;

theta3rad = deg2rad(theta(3));

syms beta_angle

fs = p3*p3 + j43*j43 - 2*p3 * j43 * cos(theta3rad);
es = d4*d4 + j43*j43 - 2*d4*j43*cos(beta_angle);

gamma = acos((p3*p3 + dp*dp - es) / 2*dp*p3);
phi = acos((d4*d4 + dp*dp - fs) / 2*d4*dp);

eqn = 2*pi == theta3rad + beta_angle + gamma + phi;

solbeta = rad2deg(real(double(solve(eqn, beta_angle))));
theta4 = 180 - solbeta;

% Get D-H Matrices
A1 = getT(l(1), alph(1), theta(1));
A2 = getT(l(2), alph(2), theta(2));
A3 = getT(l(3), alph(3), theta(3));
A4 = getT(l(4), alph(4), theta4);

% Propogate Reference Frames
link1 = A1 * origin;
link2 = A1 * A2 * origin;
link3 = A1 * A2 * A3 * origin;
link4 = A1 * A2 * A3 * A4 * origin;

% Get position of each link
x = [origin(1); link1(1); link2(1); link3(1); link4(1)];
y = [origin(2); link1(2); link2(2); link3(2); link4(2)];

% Note: Z-axis flipped for graphic purposes
z = (-1) * [origin(3); link1(3); link2(3); link3(3); link4(3)];

figure(2);

% Plot X-Y
subplot(1, 2, 2);
plot(x(1:2), y(1:2), x(2:3), y(2:3), x(3:4), y(3:4), x(4:5), y(4:5));
title('X vs. Y (Top View)');
axis([-3 6 -4 4]);

% Plot X-Z
subplot(1, 2, 1);
plot(x(1:2), z(1:2), x(2:3), z(2:3), x(3:4), z(3:4), x(4:5), z(4:5));
title('X vs. Z (Side View)');
axis([-3 6 -4 4]);
end

