#funcion que ordena los numeros de menor a mayor
function [a, b] = ordenar(x , y)
  if(x > y ),
    a = y;
    b = x;
  endif
  else
    a = x;
    b = y;
  end
end
