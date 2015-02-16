function M = codificaEnigma(matriz, lista)
  [a,b] = size(matriz);
  c = size(lista);
  x = 0;
  for(i = 0 : a)
    for(j = 0: b)
      if(matriz(0,0) == 1)
        M(0,0) = lista(1);
      end
    end
  end
end
