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

  plotExactPoints(X, Y);
  hold on; 
  
  if (O == 0)
    A = interpolate(X, Y, N);
  elseif (O == 1)
    A = leastSquares(X, Y, N);
  endif
  

  plotOtherPoints(P, transformPoints(A, P));
  plotFunction(A, X);

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

## Vector Vector -> void
## Plots the ordered points with black + markers. 
function = plotExactPoints(X, Y)
  plot(X, Y, '+');
end

## Vector Vector -> void
## Plots the ordered points with blue circular markers. 
function = plotOtherPoints(X, Y)
  plot(X, Y, "@33");
end



## Vector Vector -> void
## Plots a function with a red line and the x and y axis with black lines. 
function = plotFunction(A, X)
  deltaX = std(X);
  averageX = avg(X);
  x = averageX - 2*deltaX : deltaX/10 : averageX + 2*deltaX;
  axis = ones(x);

  plot(axis, x, 'k');
  plot(x, axis, 'k'); 

  plot(x, x*A, 'r');
end


## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the polynomial coefficient interpolation. 
function A = interpolate(X, Y, N)
  A = eye(n);
  A = A(1, :); ## STUB
end

## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the least-squares polynomial coefficient approx. 
function A = leastSquares(X, Y, N)
  A = eye(n);
  A = A(1, :); ## STUB
end


## Vector Vector(n) -> Vector(n)
## Applies the matrix function to the points in P. 
function Y = transformPoints(A, P)
  Y = P; ## STUB
end
