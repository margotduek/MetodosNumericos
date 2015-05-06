                                # PROYECTO FINAL
                                # METODOS NUMERICOS

## ITESM CSF
## prof. Victor de la Cueva

## Margot Duek
## Alexander Hernandez
## Gerardo Garcia-Teruel


## Vector Vector Natural Integer Vector -> Vector Boolean
## X : X-coordinates.
## Y : Y-coordinates.
## N : Degree of polynomial approximation.
## O : 0 - Interpolation. 1 - Least Squares.
## P : X-coordinates of points to find y-apprximation. 
function [A, E] = aproxima(X, Y, N, O, P)
  E = 0; 
  
  if  (notValid(X, Y, N, O))
    E = 1; 
    break
  endif

  if (O == 0)
    A = interpolate(X, Y, N);
    plotExactPoints(X, Y);
    plotOtherPoints(P, A'*P);
    plotFunction(A, X);
  elseif (O == 1)
    A = leastSquares(X, Y, N);
    plotExactPoints(X, Y);
    plotOtherPoints(P, A'*P);
    plotFunction(A, X);  
  endif
  

end


## Vector Vector Natural Integer  ->  Boolean
## Returns true if the input is valid.
function R = notValid(X, Y, N, O)
  xPoints = length(X);
  yPoints = length(Y);
  R = xPoints == 0;
  R = R || yPoints == 0;
  R = R || N < 1;
  R = R || N >= xPoints;
  R = R || O < 0;
  R = R || O > 1;
  R = R || xPoints != yPoints; 
end


