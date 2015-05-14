## Vector(M) Natural -> Matrix(M, N)
## Expands X to include all its powers from 0 until n. 
function R = expandPowers(X, N)
  R = X.^0;
  for i = 1 : N
    R = [R (X.^i)];
  endfor
end

%!test
%! a = [1; 2; 3];
%! assert(expandPowers(a, 0), [1; 1; 1]);
%! assert(expandPowers(a, 1), [1 1; 1 2; 1 3]);
%! assert(expandPowers(a, 2), [1 1 1; 1 2 4; 1 3 9]);
