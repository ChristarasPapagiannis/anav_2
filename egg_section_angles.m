function [gE, gF] = egg_section_angles(d, h)
    R = d/2;
    % Υπολογισμός γωνίας για κυκλικό τμήμα (Ε, F)
    % Εδώ vάζεις τη γεωμετρία του αγωγού (π.χ. θ=2*acos(1-h/R))
    if h <= R
        gE = 2 * acos(1 - h/R);
        gF = gE;
    else
        gE = 2*pi;
        gF = 2*pi;
    end
end