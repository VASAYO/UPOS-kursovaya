clc; clear; close all;

%% Сигнал
    E = 3.5;
    Fc = 200e6;
    Fmod = 45e3;
    m = 8;

    % Полоса сигнала
        SigBW = 2*Fmod*(1+m+sqrt(m));

%% Входная цепь
    % Сопр-е антенны
        Ra = 50;
    % Нагруз-е сопротивление
        Rl = +inf;

    % Полоса ВЦ
        IC_BW = SigBW * 9;

    % Экв. резис-ное сопр-е
        IC_Req = (Ra^-1+Rl^-1)^-1;

    % Добротность
        IC_Qeq = 21;

    % Волновое сопротивление 
        IC_ro = IC_Req / IC_Qeq;

    % Ёмкость контура
        IC_C = 1 / (2*pi * Fc * IC_ro);
    % Инд-сть контура
        IC_L = 1 / (2*pi * Fc)^2 / IC_C;

%% Усилитель радиочастоты
    % Исходные данные
        E = 3.5;
        Fc = 200e6;
        Ku = 10;
        Rl = +inf;
        Rc = 100;

    % РТ
        % Напряжения
            Vce = 1;
            Vbe = 665.128e-3;
        % Токи
            Ic = 5.354e-3;
            Ib = 32e-6;
            Ie = Ic + Ib;

    % Эмиттерный резистор
        Re = (E - Vce) / Ie;

    % Потенциалы базы и эмиттера
        Ve = Re * Ie;
        Vb = Ve + Vbe;

    % Отношение тока через нижний резистор делителя к току базы
        b = 3;

    % Верхний резистор делителя
        R1 = (E - Vb) / (b+1) / Ib;
    % Нижний резистор делителя
        R2 = Vb / b / Ib;
    % Их параллельное сопротивление
        R1R2 = (1/R1 + 1/R2)^-1;

    % Экв-е рез-е сопр-ние УРЧ
        Req = (1/Rl + 1/Rc)^-1;

    % Экв-я добротность
        Qeq = 21;
        
    % Волновое сопротивление 
        Ro = Req / Qeq;

    % Ёмкость контура
        Ck = 1 / (2*pi * Fc * Ro);
    % Инд-сть контура
        Lk = 1 / (2*pi * Fc)^2 / Ck;

    % Коэффициент ОС
        beta = (17.11/10 - 1) / 17.11;
    % Сопр-ние ОС
        Rfb = beta * Req;

%% Буфер
    E = 3.5;
    Rl = 100;

    % РТ
        % Напряжения
            Vce = 1;
            Vbe = 663.1e-3;
        % Токи
            Ic = 4.983e-3;
            Ib = 30e-6;

            Ie = Ic + Ib;

    % Эмиттерный резистор
        Re = (E - Vce) / Ie;

    % Потенциалы базы и эмиттера
        Ve = Re * Ie;
        Vb = Ve + Vbe;

    % Отношение тока через нижний резистор делителя к току базы
        b = 3;

    % Верхний резистор делителя
        R1 = (E - Vb) / (b+1) / Ib;
    % Нижний резистор делителя
        R2 = Vb / b / Ib;
    % Их параллельное сопротивление
        R1R2 = (1/R1 + 1/R2)^-1;

    % Постоянная мощность
        Pdc = Vce * Ic;
    % Экв. нагрузка
        Req = (1/Re + 1/Rl)^-1;
    % Макс AC напр-ние
        Uacmax = 150e-3;
    % Макс AC ток
        Iacmax = Uacmax / Req;
    % Переменная мощность
        Pac = 0.5 * Uacmax * Iacmax;
    % Отношение мощностей
        Pdc/Pac


%% Смеситель
    E = 3.5;

    % Токовое зеркало
        I0 = 10e-3;

        % Смещение на базе
            Ub0 = 750.297e-3;
        % Ток базы
            Ib0 = 56.531e-6;

        % Резистор ток-го зеркала
            R2 = (E - Ub0) / (I0 + 2*Ib0);

        % Напр-е КЭ токового зеркала
            Uce0 = 1.169;

        % Смещение нижнего источника
            V1 = 1.169 + 720.839e-3;

        % Верхнего 
            V2 = 1.169 + 979.139e-3 + 696.46e-3;
