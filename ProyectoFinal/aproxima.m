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

  X = X';
  Y = Y';
  P = P';
  
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
  plotFunction(A, X, Y, N);

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
function plotExactPoints(X, Y)
  plot(X, Y, "k+");
end

## Vector Vector -> void
## Plots the ordered points with blue circular markers.
function plotOtherPoints(X, Y)
  plot(X, Y, "b+");
end



## Vector Vector Vector Natural -> void
## Plots a function with a red line and the x and y axis with black lines. 
function plotFunction(A, X, Y, N)
  x = plotAxis(X, Y)';
  plot(x, expandPowers(x, N)*A, 'r');
end

## Vector Vector -> vector
## Plots the axis scaled to the points and returns the continuous values
## of x for plotting the function. 
function x = plotAxis(X, Y)
  deltaX = std(X);
  averageX = mean(X);
  deltaY = std(Y)
  averageY = mean(Y);

  lowerBoundX = lowerBound(averageX, deltaX);
  upperBoundX = upperBound(averageX, deltaX);
  lowerBoundY = lowerBound(averageY, deltaY);
  upperBoundY = upperBound(averageY,deltaY);
  
  x = lowerBoundX : deltaX/10 : upperBoundX;
  y = lowerBoundY : deltaY/10 : upperBoundY;
  axisX = x;
  axisX(:) = 0;
  axisY = y;
  axisY(:) = 0;

  plot(x, axisX, 'k');
  plot(axisY, y, 'k');
end

## Real Real -> Real
## Returns the least lowerBound that ensures sign switching.
function lb = lowerBound(average, delta)
  lb = average - 3*delta;
  if(-delta < lb)
    lb = -delta;
  endif
end


## Real Real -> Real
## Returns the greatest upperBound that ensures sign switching.
function ub = upperBound(average, delta)
  ub = average + 3*delta;
  if(delta > ub)
    ub = delta;
  endif
end


## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the polynomial coefficient interpolation. 
function A = interpolate(X, Y, N)
  x = X(1:N+1);
  x = expandPowers(x, N);
  y = Y(1:N+1);
  A = inv(x)*y;
end

## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the least-squares polynomial coefficient approx. 
function A = leastSquares(X, Y, N)
  X = expandPowers(X, N);
  A = inv(X'*X)*X'*Y;
end

## Vector Vector(n) -> Vector(n)
## Applies the matrix function to the points in P.
function Y = transformPoints(A, P)
  Y = expandPowers(P, length(A) -1) * A; 
end

## Vector(M) Natural -> Matrix(M, N)
## Expands X to include all its powers from 0 until n. 
function R = expandPowers(X, N)
  R = X.^0;
  for i = 1 : N
    R = [R (X.^i)];
  endfor
end


