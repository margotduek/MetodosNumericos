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
## TODO: CURRENTLY PLOTS GREEN CROSS MARKERS. 
function plotExactPoints(X, Y)
  plot(X, Y, "@12");
end

## Vector Vector -> void
## Plots the ordered points with blue circular markers.
## TODO: CURRENTLY PLOTS BLUE CROSS MARKERS. 
function plotOtherPoints(X, Y)
  plot(X, Y, "@33");
end



## Vector Vector -> void
## Plots a function with a red line and the x and y axis with black lines. 
function plotFunction(A, X, Y, N)
  deltaX = std(X);
  averageX = mean(X);
  deltaY = std(Y);
  averageY = mean(Y);
 
  
  x = -averageX : deltaX/10 : averageX + 2*deltaX;
  y = -averageY : deltaY/10 : averageY + 2*deltaY;
  axisX = x;
  axisX(:) = 0;
  axisY = y;
  axisY(:) = 0;

  plot(x, axisX, 'k');
  plot(axisY, y, 'k');

  x = x';
  plot(x, expandPowers(x, N+1)*A, 'r');
end


## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the polynomial coefficient interpolation. 
function A = interpolate(X, Y, N)
  x = X(1:N+1);
  x = expandPowers(x, N+1);
  y = Y(1:N+1);
  A = inv(x)*y;
end

## Vector Vector Natural -> Vector(N+1)
## Returns a vector with the least-squares polynomial coefficient approx. 
function A = leastSquares(X, Y, N)
  X = expandPowers(X, N+1);
  A = inv(X'*X)*X'*Y;
end





