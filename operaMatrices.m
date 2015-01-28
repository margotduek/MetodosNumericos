%Tarea # 1
%

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

  else if(N == 4)
  end
  end
  end
  end
  end
end

function [R,E,M] = suma(A,B,a,b,c,d)
  if (a == c && b == d)
    rSuma = A + B;
  else
    E = 1;
    M = "Las dimensiones de las matrices impide su suma";
  end
end

function [rResta,E,M] = resta(A,B,a,b,c,d)
  if (a == c && b == d)
    rResta= A - B;
  else
    E = 1
    M = "Las dimensiones de las matrices impide su suma"
  end
end

function [rMult,E,M] = mult(A,B,b,c)
  if(b == c)
    rMult = A * B
  else
    E = 1
    M = "Las dimensiones de las matrices impide su suma"
  end
end

function [R,E,M] = ej3()
end

function [R,E,M] = ej4()
end
