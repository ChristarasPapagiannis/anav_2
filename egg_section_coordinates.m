function [x, y] = egg_section_coordinates(xc, yc, d, h, theta)
    R = d/2;
    % Συντεταγμένες για δοσμένη γωνία theta
    x = xc + R * cos(theta);
    y = yc + R * sin(theta);
end