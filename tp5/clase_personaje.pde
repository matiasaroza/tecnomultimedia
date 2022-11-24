class Personaje{
  //VARIABLES----------------
float posX, posY, pTam;
  
  
  //CONSTRUCTOR--------------
  
  Personaje(){
   pTam = 25;
   posX = 300;
   posY = 200;
    
  }
  
  
    //METODOS------------------
    
  void dibujarPersonaje(){
  push();
  rectMode (CENTER);
  noStroke();
  fill(200);
  rect (posX, posY, pTam, pTam);
  pop();
  }
  
  void moverPersonaje(){
    if (posX < 15){
   posX = 14; 
  } else if (posX > 585){
   posX = 586; 
  }
  if (posY < 50){
   posY = 49; 
  } else if (posY > 385){
   posY = 386; 
  }
  
  if (keyCode == LEFT) {
    posX-=2;
  } else if (keyCode == RIGHT) { 
    posX+=2;
  } else if (keyCode == UP) {
    posY-=2;
  } else if (keyCode == DOWN) {
    posY+=2;
  }
}
}
