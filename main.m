% Ομάδα 44  Θέμα 24  2024-2025
% Αλ. Άννα  Αν. Κατερίνα  Βλ. Γιάννης  Μ. Βικτόρια

clear;
clc;

% ---- Αρχικές σταθερές (τιμές παραδείγματος) ----
d       = 1.0;      % m
s       = 0.002;    % κλίση
n       = 0.013;    % συντελεστής τραχύτητας
h1      = 0.4;      % m (τυχαίο παράδειγμα)
h2      = 0.6;      % m (για ερώτημα β)
xc      = 0.0;      % x του κέντρου (τυχαίο)
yc      = 0.0;      % y του κέντρου (τυχαίο)
theta1  = 0.0;      % γωνία (τυχαίο)
theta2  = pi/2;     % γωνία (τυχαίο)

% ---- Έλεγχος δεδομένων ----
if ~check_inputs(d, s, n, h1, h2)
    error('Λάθος στα δεδομένα εισόδου!');
end

% ---- 5.α ----
[P1, A1] = egg_section_PA(d, h1);

% ---- 5.β ----
[gE, gF] = egg_section_angles(d, h2);

% ---- 5.γ ----
[x, y] = egg_section_coordinates(xc, yc, d, h2, theta1);

% ---- 5.δ ----
[xx, yy] = egg_section_arc(xc, yc, d, theta1, theta2, 20);

% ---- 5.ε ----
% Βρες h για δοσμένη παροχή Qtarget (παράδειγμα)
Qtarget = 0.25;
h_guess = d/2; % αρχική εικασία
[h_found, flag] = egg_section_find_h(d, n, s, Qtarget, h_guess);

% ---- Αποθήκευση ----
fid = fopen('results.res', 'w');
fprintf(fid, '5.α: P = %.4f, A = %.4f\n', P1, A1);
fprintf(fid, '5.β: γωνίες Ε = %.4f rad, F = %.4f rad\n', gE, gF);
fprintf(fid, '5.γ: (x, y) = (%.4f, %.4f)\n', x, y);
fprintf(fid, '5.δ: Arc σημεία:\n');
for i = 1:length(xx)
    fprintf(fid, '\t%.4f\t%.4f\n', xx(i), yy(i));
end
fprintf(fid, '5.ε: h για Q=%.3f: %.4f (flag=%d)\n', Qtarget, h_found, flag);
fclose(fid);

disp('Αποτελέσματα γραμμένα στο αρχείο: results.res');