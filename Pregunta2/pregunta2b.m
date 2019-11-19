% Erick Andres Obregon Fonseca
% Analisis Numerico para Ingenieria
% Segundo Examen Programado
% Semestre II. 2019
% Pregunta 2
% Ejercicio b

clear all;
close all;


% Funcion del ejercicio a
function z = f1(x, y)
  z = (x + y)/x;
endfunction

% Implementacion del ejercicio b
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
