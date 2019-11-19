% Erick Andres Obregon Fonseca
% Analisis Numerico para Ingenieria
% Segundo Examen Programado
% Semestre II. 2019
% Pregunta 1
% Ejercicio b

clear all;
close all;


% Funcion del ejercicio a
function y = f(x)
  y = x^2*e^(x^2);
endfunction

% Implementacion del ejercicio b
function I = NC4(a, b)
  h = (b - a)/5;
  I = (5*h/24) * (11*f(a + h) + f(a + 2*h) + f(a + 3*h) + 11*f(a + 4*h));
endfunction
