function Q = egg_discharge(d, h, n, s)
    [P, A] = egg_section_PA(d, h);   % 
    if P == 0
        Q = 0;
    else
        Rh = A / P;
        Q = (1/n) * A * Rh^(2/3) * s^(1/2);
    end
end