% Erick Andres Obregon Fonseca
% Analisis Numerico para Ingenieria
% Segundo Examen Programado
% Semestre II. 2019
% Pregunta 2
% Ejercicio c

clear all;
close all;


% Funcion del ejercicio a
function z = f1(x, y)
  z = (x + y)/x;
endfunction

% Funcion del ejercicio b
function [x, y] = runge_kutta_6(a, b, y0, m)
  h = (b - a)/(m - 1);
  x = a:h:b;
  y(1) = y0;
  for i=2:m
    k1 = h*f1(x(i-1), y(i-1));
    k2 = h*f1(x(i-1) + h/3, y(i-1) + k1/3);
    k3 = h*f1(x(i-1) + 2*h/5, y(i-1) + (4*k1 + 6*k2)/25);
    k4 = h*f1(x(i-1) + h, y(i-1) + (k1 - 12*k2 + 15*k3)/4);
    k5 = h*f1(x(i-1) + 2*h/3, y(i-1) + (6*k1 + 90*k2 - 50*k3 + 8*k4)/81);
    k6 = h*f1(x(i-1) + 4*h/5, y(i-1) + (6*k1 + 36*k2 + 10*k3 + 8*k4)/75);
    y(end + 1) = y(end) + (23*k1 + 125*k2 - 81*k5 + 125*k6)/192;
  endfor
endfunction


% Implementacion del ejercicio c
% Valores iniciales
a = 2;
b = 10;
y0 = 4;
% Aproximaciones
[x10, y10] = runge_kutta_6(a, b, y0, 10);
[x20, y20] = runge_kutta_6(a, b, y0, 20);
[x50, y50] = runge_kutta_6(a, b, y0, 50);
[x100, y100] = runge_kutta_6(a, b, y0, 100);
[x250, y250] = runge_kutta_6(a, b, y0, 250);
% Valor exacto
x = linspace(a, b, 250);
y = x.*log(x./2) .+ 2.*x;
% Grafica
plot(x, y, x10, y10, x20, y20, x50, y50, x100, y100, x250, y250);
title("Runge Kutta de Orden 6");
legend("Valor exacto", "10pts", "20pts", "50 pts", "100pts", "250pts");
xlabel("x");
ylabel("f(x)");
