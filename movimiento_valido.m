% Valida que quieran mover el 0 a una posición fuera de la matriz
function valido = movimiento_valido(tablero, movimiento)
  [row, col] = find(tablero == 0);
  n = size(tablero, 1);

  valido = true;
  switch movimiento
    case "W"
      if row == 1
        valido = false;
      end
    case "A"
      if col == 1
        valido = false;
      end
    case "S"
      if row == n
        valido = false;
      end
    case "D"
      if col == n
        valido = false;
      end
  end
endfunction
