clc
fprintf(' Bienvenidos al juego de xxxxx!!!\n Este juego fue creado por las estudiantes de la Universidad General Sarmiento: \n -Gimenez Rodrigo \n -Maria Florencia Herrera \n -Hernandez Fabian \n')
fprintf('Instrucciones: \n El juego consiste en que cada jugador mueva una pieza del tablero para formar una forma configuaracion especifica final.\n En cada turno, cada jugador deberá ir moviendo las fichas que se encuentren al rededor del espacio vacio.\n El jugador que primero logre ordenar el tablero en la configuracion esperada gana la partida.\n Si no son iguales, será el turno del siguiente jugador.\n Ganará la partida el jugador que haya encontrado más pares.\n ')

nombres_jugadores = obtener_jugadores();

tablero = crear_tablero();

jugar(tablero, nombres_jugadores);
