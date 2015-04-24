% Margot Duek
% Métodos numéricos para la ingeniería
% GaussJordan


function [x, Ainv, d, Solucion] = gaussJordan(A, b, op)

  % Revisamos si la matriz es valida ... si no para no hacer nada
  if(!(rank(A) == size(A, 2)))
    Solucion = 0;
    break;
  end

  if(op == 1)
    tam = size(A, 2);
    A = [A b];
    x = gj(A, tam);
    x = x(:, tam+1);

  elseif( op == 2)
    tam = size(A, 2);
    A = [A eye(n)];
    tamG = size(A, 2);

    
  else
    return;
  end


  % Se crea la matriz aumentada
  A = [A b];
  n = size(A,1);
  for i=1:n
    % Dividir renglon entre el pivote
    A(i ,:) = A(i,:)/A(i, i );
    % Hacer ceros en la columna i
    for j=1:n
      if i!=j
        A(j ,:) = A(j,:) - A(i,:)∗A(j,i );
      end
    end
  end
  x = A;
end

function [xx, determinante] = gj (A, tam)
  determinante = 1;
  for ( i = 1 : n)
    [A, b] = pivot(A, i, n);
    determinante = determinante * ((-1) ^b) * (A(i,i));
    A(i ,:) = A(i,:)/A(i, i);
    for (j = 1 :n)
      if (i != j)
        A(j ,:) = A(j,:) - A(i,:)∗A(j,i );
      end
    end
  end
  xx= A;
end


function [xx, cambios] = pivot (A, columna, tam)

  max = A(columna,columna);
  c = columna;
  cambios = 0;
  for(i = columna+1:n)
    if(abs(A(i,columna)) > max)
      max= A(i,col);
      c = i;
      ++cambios;
    end
  end

  temp = A(columna, :);
  A(columna, :) = A(c, :);
  A(c, :) = temp;
  xx = A;

end









## Interactive function, receives:
## A) The coefficient matrix A.
## B) The constant terms b.
## C) A natural number:
##                      1 to compute the solution vector.
##                      2 to compute the inverse and determinant.

## If n == 1. Return the solution vector. AIn, Determinant don't matter.
## If n == 2. Return AIn, Determinant. The solution vector doesn't
## matter.


## Matrix[m, n] Vector[n] -> (Vector[n]|Zero) (Matrix[m,n]|Zero) Real.
function [Sol, AIn, Determinant, hasSolution] = gaussJordan(A, b, n)
Sol = 0;
AIn = 0;
Determinant = 0;
hasSolution = 1;

if (!validMatrix(A))
hasSolution = 0;
return;
endif

switch(n)

case 1
Sol = solve(A, b);

case 2
[AIn, Determinant] = computeInverse(A);

otherwise
return;

endswitch

end

## Bool -> Matrix
## Returns true if the rank of the matrix is equal to the number
## of columns of the matrix. False otherwise.
function R = validMatrix(A)
R= (rank(A) == size(A, 2));
end

## Matrix, Natural, Natural -> Matrix Natural
## Adjusts the pivot in the col specified so that it is the greatest
## absolute value of the possible entries. Returns the new matrix and
## the number of flips.
## N is the size of the matrix (not the augmented matrix).
function [ANS, flips] = adjustPivotInCol(A, col, n)
R = col;
max = A(col, col);
flips = 0;

for (i = col+1:n )

if(abs(A(i, col)) > max)
max = A(i, col);
R   = i;
flips++;
endif
endfor

if(i != col)
b = A(col, :);
A(col, :) = A(R, :);
A(R, :)   = b;
ANS = A;
endif
end

## Returns the solution of a system of linear equations through
## Gauss-Jordan.
## ASSUMES: The system has a unique solution.
function R = solve(A, b)
n = size(A, 2);
A = [A b];

R = gaussJordanAlgorithm(A, n);
R = R(:, n+1);

end

## Matrix Natural -> Matrix Real.
## Produces the row reduced echelon form of the matrix A.
## n is the size of the matrix (Not the augmented matrix).
function [output, det] = gaussJordanAlgorithm(A, n)
det = 1;
for (i = 1 : n)
[A, b] = adjustPivotInCol(A, i, n);
det = det * ((-1) ** b);
diagonalEntry = A(i, i);
det = det *  diagonalEntry;
A(i, :) = A(i, :) / diagonalEntry;

for (j = 1 : n)
if(i != j)
A(j, :) = A(j, :) - A(j, i)* A(i, :);
endif
endfor
endfor
output = A;
end

## Matrix -> Matrix
## Computes the inverse of the matrix A
## ASSUMES: Matrix A is invertible.
function [inverseMatrix, det] = computeInverse(A)
n = size(A, 2);
A = [A eye(n)];
s = size(A, 2);

[A, det] = gaussJordanAlgorithm(A, n);
inverseMatrix = A(1:n, n+1:s);
end
