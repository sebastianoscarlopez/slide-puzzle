function sonido_tecla()
    Fs=4400;
    t=0:1/Fs:0.3;
    y=sin(2*pi*440*t);
    sound(y,Fs)
endfunction