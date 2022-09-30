class Globo{
  //VARIABLES----------------
  int px, py, ptam;
  PImage personaje;
  
  
  //CONSTRUCTOR--------------
  Globo(){
   ptam = 100;
   px = 200;
   py = height/2;
   personaje = loadImage("globo.png");
  }
  
  
  //METODOS------------------
  void dibujarGlobo(){
   push();
   noFill();
   noStroke();
   rectMode(CENTER);
   rect(px,py,ptam/2,ptam+25);
   imageMode(CENTER);
   image(personaje, px, py, ptam/2, ptam+25);
   pop();
  }
  
  void moverPersonaje(){
  if(mousePressed){
     py -= 5; 
  } else {
     py += 2; 
  }

  }

  
}
