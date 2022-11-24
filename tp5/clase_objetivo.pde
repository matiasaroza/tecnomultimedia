class Objetivo{

   //VARIABLES---------------------
   int bTam, tiempo;   
   float ubiX1;  //posicion inicial bola x1 
   float ubiY1;  //posicion inicial bola y1


  //CONSTRUCTOR-------------------
  Objetivo(){
   tiempo = 60*8;
   ubiX1 = random (10, 590);
   ubiY1 = random (10, 590);
   bTam = 8;
  }
  
  Objetivo(float pny){
    tiempo = 60*8;
   ubiX1 = random (10, 590);
   ubiY1 = random (10, 590);
   bTam = 8;
  }  
  
  
  //METODOS------------------
void dibujarObjetivo() {
  // DIBUJAR BOLITAS 1     
    strokeWeight(1);
    fill(0, 0, 255);
    ellipse (ubiX1, ubiY1, bTam, bTam);
  }
  
  void moverObjetivo(){
  //CAMBIO DE POSICION DE BOLITAS 1
  if(frameCount%tiempo == 0){
    ubiX1 = random (10, 590);
    ubiY1 = random (100, 390);
    }
  }
}
