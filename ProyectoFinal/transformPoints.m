## Vector Vector(n) -> Vector(n)
## Applies the matrix function to the points in P.
%!test
%! a = [0]';
%! b = [1 2]';
%! c = [0, 3, 1]';
%! A = [1 2 3]';
%! assert(transformPoints(a, A), [0;0;0]);
%! assert(transformPoints(b, A), [3; 5; 7]);
%! assert(transformPoints(c, A), [4; 10; 18])
function Y = transformPoints(A, P)
  Y = expandPowers(P, length(A) -1) * A; 
end


