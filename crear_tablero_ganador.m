% crea un tablero de n x n y deja el último elemento en 0, representando la posición vacía
function tablero_ganador = crear_tablero_ganador(n)
  tablero_ganador = reshape(1:n*n, n, n)'; % El ' al final es porque reshape arma la transpuesta. 
  tablero_ganador(n,n) = 0; % el último elemento es 0, representando la posición vacía
endfunction
