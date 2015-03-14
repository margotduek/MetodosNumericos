
function [x, Error] = biseccionn(xI, xD, eps, maxit)

if(xI < xD)
  temp = xI;
  xI = xD;
  xD = temp;
end

t = (xI+xD)/2;
  if((f(xI)) * (f(xD)) > 0)
    Error = 1
    x = "El metodo no llego a la solucion";
    break;
  elseif((xD - xI)/2 < eps)
    x = (xI+xD)/2;
    Error = 0
  end


  for i = 1:maxit
    while((f(t) != 0) & abs(xD - xI)>eps)
      if (f(t)*f(xD) < 0)
        xI = t;
      else
        xD = t;
      end
      t = (xI+xD)/2;
    end
    x = t;
    Error = 0;
  end
end
