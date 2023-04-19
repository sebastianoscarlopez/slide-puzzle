function nombres_jugadores = obtener_jugadores()
  num_jugadores = input("Ingrese la cantidad de jugadores (entre 1 y 4): ");

  nombres_jugadores = cell(num_jugadores); % Crea un arreglo de celdas vacias, porque con array de strings no funciona
  for i = 1:num_jugadores
      nombres_jugadores(i) = input(cstrcat("Ingrese el nombre del jugador ", num2str(i), " :"), 's');
  end
endfunction