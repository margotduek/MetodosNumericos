
function [x,Error] = newtonRaphson(x, eps, maxit)
  while(i < maxit & abs(f(x)) <= eps)
    x1 = x - (f(x) / df(x));
    x = x1;
    Error = abs(f(x));
  end
end
