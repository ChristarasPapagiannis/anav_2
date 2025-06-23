function U = egg_velocity(d, h, n, S)
    [P, A] = egg_section_PA(d, h);
    if P == 0
        U = 0;
    else
        Rh = A / P;
        Q = (1/n) * A * Rh^(2/3) * S^(1/2);
        U = Q / A;
    end
end