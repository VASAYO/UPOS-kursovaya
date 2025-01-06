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

L1 = 1e-9;
L2 = 50e-9;
L3 = L2;

Q = 30;

Rloss = (2 * pi * Fpc * L1)/Q;

Cindet = 1/((2 * pi * Fpc)^2 * L1);
C2 = 1/((2 * pi * Fpc)^2 * (L2 + L3));

lowBound = 1/Fpc;
highBound= 1/Fmod;
% lowbound < tetaDet < highbound, tetaDet = Rdet * Cdet
tetaDet = 30e-6;
Rdet = 5e3;
Cdet = tetaDet / Rdet;

% Csv >> Cdet, Lsv >> L1
Lsv = 100e-6;
Csv = 120e-9;