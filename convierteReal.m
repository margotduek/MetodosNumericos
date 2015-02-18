%Tarea # 2
%Programa para convertir números binaris a decimales y viceversa


%Función principal:
function [R,E]  = convierteReal(n , m , e , b)
  if(b == 0)
    [R, E] = decimoalABinario(n , m , e);
  else if(b == 1)
    [R, E] = binarioADecimal(n , m , e);
  else
    %return -1;
  end
  end
end

%función en la cual se convierte de decimal a binario:
function [R, E] = decimoalABinario(n , m , e)
  tamanio = 2 + m + e;
  %Primer if, para ver si la mantisa es positiva o negativa
  temp = floor(n);
  puntoFlotante = n - temp;
  n = temp;
  if (n < 0)
    signoMantisa = '1';
    n = n*-1
  else
    signoMantisa = '0';
  end
  %if para ver si el exponente es negativo o positivo
  if(n > 0 & n < 1)
    signoExponente = '1';
  else
    signoExponente = '0';
  end
  %convertimos el numero a decimal a binario
  mantisa = dec2bin(n);
  %Revisamos el tamaño de la amntisa
  [tamm, tam] = size(mantisa);
  %Convertimos el exponente a binario
  exponente = dec2bin(tam);

  %Convertimos manualmente el puento decimal porque no existe puncion que los
  %convierta.
  mult = puntoFlotante;
  decimales = "";
  for(g = 1: 5)
    mult = 2  * mult;
    if(mult >= 1)
      decimales = strcat(decimales, "1");
      mult= mult -1;
    else
      decimales = strcat(decimales, "0");
    end
  end
  %Concatenamos los numeros en binario que tenemos
  r = strcat(signoMantisa, signoExponente, exponente, mantisa, ".", decimales);
  ab = strcat(signoMantisa, signoExponente, exponente, mantisa, decimales)
  R = ab(1:tamanio)
  [l,tamr] = size(R);
  [ll,tamab] = size(ab);
  if(tamr < tamab)
    e = ab(tamanio: tamab)
    E = (bin2dec(e))/100
  end
end



%Función para convertir de binario a decimal
function [R, E] = binarioADecimal(n , m , e)
  [tam, tamm] = size(n);
  signoM = n(1);
  signoE = n(2);
  exponenteBinario = char('');
  cerosExponente = 1;
  cerosMantisa = 1;
  punto = 1;

  %Este for se puede hacer de una manera más eficiente con el método que está
  %abajo del for comentado
  %for(ii = 3 : e+2)
  %  exponente += n(ii);
  %end
  exponente = n(3:e+2);
  expon = bin2dec (exponente);

  %Este for se puede hacer de una manera más eficiente con el método que está
  %abajo del for comentado
  %for(jj = e + 2 : tam)
  %  mantisa += n(jj);
  %end
  mantisa = n(e+3:tamm);
  mantisa = bin2dec(mantisa);

  %for(mi = 1: m)
  %  punto *= 10;
  %end
  %for(ei = 1 : expon)
  %  cerosExponente *= 10;
  %end

  %if(signoE == "1")
  %  r = (mantisa/punto) / cerosExponente
  %  Ri = bin2dec(r)
  %else if(signoE == "0")
  %  Ri = bin2dec(mantisa);
  %end
  %end


  if(signoM == "1")
    R = mantisa * -1;
  else if(signoM == "0")
    R = Ri;
  end
  end
  E = "ahorita les digpo";

end
