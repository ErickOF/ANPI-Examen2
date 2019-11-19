% Erick Andres Obregon Fonseca
% Analisis Numerico para Ingenieria
% Segundo Examen Programado
% Semestre II. 2019
% Pregunta 1
% Ejercicio c

clear all;
close all;


% Funcion del ejercicio a
function y = f(x)
  y = x^2*e^(x^2);
endfunction

% Funcion del ejercicio b
function I = NC4(a, b)
  h = (b - a)/5;
  I = (5*h/24) * (11*f(a + h) + f(a + 2*h) + f(a + 3*h) + 11*f(a + 4*h));
endfunction

% Implementacion del ejercicio c
function I = NCA4_compuesto(a, b, n)
  % Separacion entre valores
  step = (b - a)/n;
  % Aproximacion de la integral
  I = 0;
  for i=0:n-1
    % Aplicacion del metodo NC4 a cada intervalo
    I += NC4(a + i*step, a + (i + 1)*step);
  endfor
endfunction

disp(NCA4_compuesto(0, 1, 10));
