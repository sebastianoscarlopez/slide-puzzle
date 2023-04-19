% Se crea un tablero Compara el tablero actual con el tablero ganador
function gano = gano_juego(tablero)
  n = size(tablero, 1);
  igualdad_de_matrices = tablero == crear_tablero_ganador(n); % compara las matrices, quedan 1 en los elementos iguales y 0 en los diferentes
  gano = ~any(igualdad_de_matrices(:) == 0); % si no hay ningún elemento que sea falso, gano es true
endfunction