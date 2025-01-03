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

L1 = 50e-6;
L2 = L1;
L3 = L2;
coupling = 0.5;

Q = 30;

Rloss = (2 * pi * Fpc * L1)/Q;

Cindet = 1/((2 * pi * Fpc)^2 * L1);
C2 = Cindet/2;

highBound = 1/Fpc;
lowBound = 1/Fc;
% lowbound < tetaDet < highbound, tetaDet = Rdet * Cdet
tetaDet = (highBound - lowBound) / 2;
Rdet = 5e3;
Cdet = tetaDet / Rdet;

% Csv >> Cdet, Lsv >> L1
Csv = 5e-9;
Lsv = 50e-3;