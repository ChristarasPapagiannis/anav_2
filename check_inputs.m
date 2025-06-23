function ok = check_inputs(d, s, n, h1, h2)
    ok = true;
    if d <= 0 || d >= 10
        ok = false;
        return;
    end
    if s <= 0 || s >= 1
        ok = false;
        return;
    end
    if n <= 0 || n >= 0.2
        ok = false;
        return;
    end
    if h1 < 0 || h1 > 0.9*d
        ok = false;
        return;
    end
    if h2 < 0 || h2 > 0.9*d
        ok = false;
        return;
    end
end