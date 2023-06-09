% Empieza creando un tablero ganador, luego lo desordena con movimientos aleatorios
function matriz = crear_tablero()
  n = 0;
  disp("¿Tamaño de dificultad del tablero");
  disp("    1 (fácil 3x3)");
  disp("    2 (moderado 4x4)");
  disp("    3 (profesional 5x5)");
  while n < 1 || n > 3 % tamaño del tablero entre 3 y 9, sino se vuelve a pedir
    n = kbhit(); % lee el número, pero como texto
    n = str2num(n); % convierte a número
  end

  matriz = crear_tablero_ganador(n + 2);
  for i = 1:1000 % 1000 movimientos aleatorios
    opcion = randi(4); % genera un número aleatorio entre 1 y 4
    switch opcion
      case 1
        opcion = "W";
      case 2
        opcion = "A";
      case 3
        opcion = "S";
      case 4
        opcion = "D";
    end
    if movimiento_valido(matriz, opcion)
      matriz = mover_ficha(matriz, opcion);
    end
  end
endfunction
