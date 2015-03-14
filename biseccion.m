% Margot Duek
% Tarea 3
% Método de biseccion
% Para crear esta tarea, me basé en un pseudocódigo de internet :
% http://es.wikipedia.org/wiki/M%C3%A9todo_de_bisecci%C3%B3n

function [x, Error] = biseccion(xI, xD, eps, maxit)




  % Al multiplicar las dos funciones vemos si tienen diferentes signos, si sus
  % signos son contrarios, la multiplicación daría menor a 0
  % tambien comprobamos que Xi sea mas pequeño que xD par ano tener errores
  if (xI > xD | f(xI)*f(xD) > 0)
    Error = 1;
    x = "El metodo no llego a la solucion";
    return;
  end

  i = 1;
  while(i <= maxit)
      if (f((xI+xD)/2)*f(xD) < 0)
        xI = (xI+xD)/2;
      else
        xD = (xI+xD)/2;
      end

      if (abs(xD - xI)<eps | (f((xI+xD)/2) == 0))
        break;
      end

      i++;

    end
    x = (xI+xD)/2;
    Error = 0;

end
