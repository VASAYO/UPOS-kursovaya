clear; clc; close all

% Амплитудный ограничитель
Fmod = 45e3;
Rao = 10;
Cao = 100e-6;
tau = Rao * Cao; % tau >> 1/Fmod

% Детектор
Fc = 200e6;
Fg = 220e6;
Fpc = Fg - Fc;

Cindet = 500e-12;
C2 = 5e-12;
L1 = 1/((2 * pi * Fpc)^2 * Cindet);
L2 = (1/((2 * pi * Fpc)^2 * C2)) / 2;
L3 = L2;

Q = 30;

Rloss = (2 * pi * Fpc * L1)/Q;

Lsv = L1 * 1e3;
Csv = max(Cindet, C2) * 1e3;

% 1/Fc < teta < 1/Fmod
lowBound = 1/Fpc;
highBound = 1/Fmod;
teta = 30e-6;

Rdet = 5e3;
Cdet = teta/5e3;