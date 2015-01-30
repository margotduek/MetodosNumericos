%Tarea # 1
%Funcion principas que llama a 5 funciones para hacer diferentes operaciones

function [R,E,M] = operaMatrices(A,B,N)
  [a,b] = size(A);
  [c,d] = size(B);

  if(N == 0)
    [R,E,M] = suma(A,B,a,b,c,d);
  else if (N == 1)
    [R,E,M] = resta(A,B,a,b,c,d);
  else if(N == 2)
    [R,E,M] = mult(A,B, b ,c );
  else if(N == 3)
    [R,E,M] = ej3(A);
  else if(N == 4)
    [R,E,M] = ej4(A);
  end
  end
  end
  end
  end
end

%Esta funcion recibe como parametros las 2 matrices y los otros cuatro son el
%el tamaño de las matrices, esta funcion suma los elementos de las matrices.
function [R,E,M] = suma(A,B,a,b,c,d)
  if (a == c && b == d)
    rSuma = A + B;
  else
    E = 1;
    M = "Las dimensiones de las matrices impide su suma";
  end
end

%Esta funcion recibe como parametros las 2 matrices y los otros cuatro son el
%el tamaño de las matrices, esta funcion resta los elementos de las matrices
function [rResta,E,M] = resta(A,B,a,b,c,d)
  if (a == c && b == d)
    rResta= A - B;
  else
    E = 1
    M = "Las dimensiones de las matrices impide su suma"
  end
end

%Esta funcion recibe como parametros las 2 matrices y los otros dos son el
%el tamaño de las matrices, esta funcion multiplica las dos matrices.
function [rMult,E,M] = mult(A,B,b,c)
  if(b == c)
    rMult = A * B
  else
    E = 1
    M = "Las dimensiones de las matrices impide su suma"
  end
end

function [R,E,M] = ej3(A)
  [f,c] = size(A);
  uno = median(A);
  dos = std(A);
  R = [uno; dos]
end

function [R,E,M] = ej4(A)
  ab = max(A);
  ac = min (A);
  R = [ab; ac]
end
