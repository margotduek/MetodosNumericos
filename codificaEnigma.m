function M = codificaEnigma(matriz, lista)
  for(i =1 : a)
      for(j = 1 : b)
        M(i,j) = lista (matriz(i,j) + 1)
      end
  end
end




function M = codificaEnigmaMal(matriz, lista)
  [a,b] = size(matriz);
  x = 0;
  for(u = 0 : a)
    for(o = 0: b)
      if (matriz(u,o) == x)
        M(u, o) = lista(x)
      end
      x++;
    end
  end
end
