%Tarea # 3
%Margot Duek
%Una funcion que saque la  raiz por medio del metodo Newton Raphson

function [x,Error] = newtonRaphson(x, eps, maxit)
  %For para hacer el metodo la cantidad de veces que el usuario lo pida
  for(i = 1 : maxit)
    %Fórmula
    xa = x - (f(x) / df(x));
    x = xa;
    %Revisa que el error sea menor a lo que esta pidiendo el usuario
    if(abs(f(x)) <= eps)
      Error = abs(f(x))
      break;
    end
  end
end
