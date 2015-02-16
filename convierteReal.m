%Tarea # 2


function [R,E]  = convierteReal(n , m , e , b)
  if(b == 0)
    %#convertir de decimal a binario
  else if(b == 1)
    binarioADecimal(n , m , e);
  else
    %return -1;
  end
end
end


function [R, E] = decimoalABinario(n , m , e)

end

function [R, E] = binarioADecimal(n , m , e)
  [tam, tamm] = size(n)
  signoM = n(1);
  signoE = n(2);
  exponenteBinario = char('');
  cerosExponente = 1;
  cerosMantisa = 1;
  punto = 1;


  %for(ii = 3 : e+2)
  %  exponente += n(ii);
  %end
  exponente = n(3:e+2)
  expon = bin2dec (exponente);


  %for(jj = e + 2 : tam)
  %  mantisa += n(jj);
  %end
  mantisa = n(e+3:tamm)
  mantisa = bin2dec(mantisa)

  for(mi = 0: m)
    punto *= 10;
  end
  for(ei = 0 : exponente)
    cerosExponente *= 10;
  end

  if(signoE == 1)
    r = (mantisa/exponente) / cerosExponente
    R = bin2dec(r)
  else if(signoE == 0)
    r = (mantisa/exponente) * cerosExponente
    R = bin2dec(r)
  end
  end

end
