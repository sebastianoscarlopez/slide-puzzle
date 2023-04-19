% Mueve el 0 a la posición indicada por el movimiento
function tablero = mover_ficha(tablero, movimiento)
  [row, col] = find(tablero == 0);
  switch movimiento
    case "W"
      tablero(row, col) = tablero(row - 1, col);
      tablero(row - 1, col) = 0;
    case "A"
      tablero(row, col) = tablero(row, col - 1);
      tablero(row, col - 1) = 0;
    case "S"
      tablero(row, col) = tablero(row + 1, col);
      tablero(row + 1, col) = 0;
    case "D"
      tablero(row, col) = tablero(row, col + 1);
      tablero(row, col + 1) = 0;
  end
endfunction
