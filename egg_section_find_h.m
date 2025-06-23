function [h_found, flag] = egg_section_find_h(d, n, s, Qtarget, h_guess)
    % Επιστρέφει το h ώστε Q(d,h,n,s) = Qtarget
    fun = @(h) egg_discharge(d, h, n, s) - Qtarget;
    % Ορισμός ορίων (σύμφωνα με ελέγχους)
    hmin = 0.01;
    hmax = 0.9 * d;
    if fun(hmin) * fun(hmax) > 0
        h_found = NaN;
        flag = -1;
        return;
    end
    [h_found, ~, flag] = fzero(fun, [hmin hmax]);
end