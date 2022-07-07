void cambiarAEstadoInicio(){
  if(mouseX >= 225 && mouseX <= 375 && mouseY >= 285 && mouseY <= 315){
      estado = 0;
    }
}

void cambiarAEstadoIntro(){
 estado=1; 
}

void cambiarAEstadoJugando(){
 //asigna todos los valores iniciales del estado jugando:
  estado=2;
    
    // VALORES INICIALES ENEMIGO
    etam = random(7, 10);
    evel = random(2, 4);
    ex = -etam;
    ex2 = width+etam;
    ey = -etam;
    tiempo1 = 0;
    
    // VALORES INICIALES PERSONAJE
    posX = 300;
    posY = 200;
    pTam = 25;
    
    // VALORES INICIALES BOLITAS
    bTam = 8;
    
    // VALORES INICIALES INFO
    tiempo = 60*10;
    contador = 0; 
    vidas = 3; 
  
}
void cambiarAEstadoGanaste(){
 if(contador == 10){
   estado = 3;
 }
}
  
void cambiarAEstadoPerdiste(){
 if(vidas == 0){
   estado=4;
 }
}
