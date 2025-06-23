function [P, A] = wet_section_egg(d, h)
    R = d / 2;
    hE = d;
    hF = d + d/2;
    if h < 0 || h > hF
        error('Το ύψος h πρέπει να είναι 0 < h <= d + d/2');
    end
    if h <= hE/2
        [A, P] = circular_segment(R, h);
    elseif h <= hE
        h_circ = hE/2;
        h_rect = h - h_circ;
        [A1, P1] = circular_segment(R, h_circ);
        A2 = d * h_rect;
        P2 = 2 * h_rect;
        A = A1 + A2;
        P = P1 + P2;
    else
        h_circ = hE/2;
        [A1, P1] = circular_segment(R, h_circ);
        A2 = d * (hE - h_circ);
        P2 = 2 * (hE - h_circ);
        h_top = hF - h;
        [A_top, P_top] = circular_segment(R, h_top);
        A_full = pi * R^2;
        P_full = pi * d;
        A = A1 + A2 + (A_full - A_top);
        P = P1 + P2 + (P_full - P_top);
    end
end