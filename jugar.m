function jugar(tablero, nombres_jugadores)
  orden_aleatorio = randperm(length(nombres_jugadores)); % orden aleatorio de los indices
  nombres_jugadores_desordenados = nombres_jugadores(orden_aleatorio);
  
  % mientras no se presione Q y no se haya ganado el juego, se sigue jugando
  turno = 1;
  opcion = " ";
  while opcion != "Q" && !gano_juego(tablero)
    clc;
    nombre = nombres_jugadores_desordenados(turno);
    disp(cstrcat("Turno de ", char(nombre)));
    dibujar_tablero(tablero);
    opcion = mover_o_salir();
    if(opcion != "Q")
      if movimiento_valido(tablero, opcion)
        tablero = mover_ficha(tablero, opcion);
        turno++;
        if(turno > length(nombres_jugadores))
          turno = 1;
        end
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

  disp(cstrcat("Gracias por jugar ", char(nombres_jugadores_desordenados(turno))));
endfunction