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
  sonido_tecla();
end