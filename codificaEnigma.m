function M = codificaEnigma(matriz, lista)
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
