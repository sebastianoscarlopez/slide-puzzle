nombre = input("¿Cuál es tu nombre? ", 's'); % solicita el nombre del usuario

n = 0;
while n < 3 || n > 9 % tamaño del tablero entre 3 y 9, sino se vuelve a pedir
  disp("¿Tamaño del tablero entre 3 y 9? ");
  n = kbhit(); % lee el número, pero como texto
  n = str2num(n); % convierte a número
end

% crea un tablero de n x n y deja el último elemento en 0, representando la posición vacía
function tablero_ganador = crear_tablero_ganador(n)
  tablero_ganador = reshape(1:n*n, n, n)'; % El ' al final es porque reshape arma la transpuesta. 
  tablero_ganador(n,n) = 0; % el último elemento es 0, representando la posición vacía
endfunction

% Simplemente muestra la matriz generada, se podría hacer más linda aquí, usando ASCII
function dibujar_tablero(tablero)
  disp(tablero);
endfunction

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

% Empieza creando un tablero ganador, luego lo desordena con movimientos aleatorios
function matriz = crear_tablero(n)
  matriz = crear_tablero_ganador(n);
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

% solicita al usuario una opción válida. W A S D o Q
function opcion = mover_o_salir()
  opcion = " "; % la opción es invalida así entra en el while
  while opcion != "Q" && opcion != "W" && opcion != "A" && opcion != "S" && opcion != "D" % si la opción no es válida, se vuelve a pedir
    disp("Presione Q para salir mueva la ficha usando las letras\r\n")
    disp(" W\r\n")
    disp("ASD: \r\n")
    opcion = kbhit(); % puede que sea valida, pero en minúscula
    opcion = toupper(opcion); % convierte la entrada a mayúsculas
  end
end

% Se crea un tablero Compara el tablero actual con el tablero ganador
function gano = gano_juego(tablero)
  n = size(tablero, 1);
  igualdad_de_matrices = tablero == crear_tablero_ganador(n); % compara las matrices, quedan 1 en los elementos iguales y 0 en los diferentes
  gano = ~any(igualdad_de_matrices(:) == 0) % si no hay ningún elemento que sea falso, gano es true
endfunction

% Empieza el juego

tablero = crear_tablero(n);

disp(cstrcat("Hola ", nombre));

% mientras no se presione Q y no se haya ganado el juego, se sigue jugando
opcion = " ";
while opcion != "Q" && !gano_juego(tablero)
  dibujar_tablero(tablero);
  opcion = mover_o_salir();
  if(opcion != "Q")
    if movimiento_valido(tablero, opcion)
      tablero = mover_ficha(tablero, opcion);
    else
      disp("Movimiento inválido");
    end
  end
end

if(gano_juego(tablero))
  disp("GANASTE!!!");
else
  disp("Con paciencia podrías haberlo ganado");
end

disp(cstrcat("Gracias por jugar ", nombre));
