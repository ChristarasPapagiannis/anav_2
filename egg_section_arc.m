function [xx, yy] = egg_section_arc(xc, yc, d, theta1, theta2, N)
    R = d/2;
    thetas = linspace(theta1, theta2, N);
    xx = xc + R * cos(thetas);
    yy = yc + R * sin(thetas);
end