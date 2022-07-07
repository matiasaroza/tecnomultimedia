int contador = 0, vidas = 3;

void jugando(){
  background(255);
    personaje();
    enemigos();
    objetivo();  
    puntos();
    vidas();
    if(frameCount%60 == 0){
      tiempo1++;
    }  
    if(contador == 10){
      estado = 3;
      
    } else if(vidas == 0){
      estado = 4;
    
  } else if (estado == 3){
    // GANO
    pantallaGano();
    
  } else if (estado == 4){
    // PERDIO
    pantallaPerdio();
    
  }
  println("segundos =" + frameCount);
}
