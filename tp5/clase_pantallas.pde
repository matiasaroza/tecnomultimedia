 class Pantallas{
  
  //VARIABLES---------------------------------------------------------
  int rx1, ry1, velrx1, pTam;
  int numero;
  PImage [] pantallas = new PImage [5];
 
  
   //CONSTRUCTOR------------------------------------------------------
  Pantallas(){
    for(int i = 0; i<pantallas.length; i++) {
      pantallas[i] = loadImage("pantalla"+i+".jpg");
    
    }
    
    rx1 = 100;
    ry1 = 200;
    velrx1 = 2;
    pTam = 25;
    
  }
  
  //METODOS--------------------------------------------------------- 
  void dibujarPantallas(int n){
  numero = n;
  image(pantallas[numero],0,0);
  }
  
  void pantallaIntro(){
  pushStyle();
  fill(100);
  textAlign(CENTER);
  text("Click para empezar...", 300, 300 );
  popStyle();
  rectMode (CENTER);
  noStroke();
  fill(200);
  rect (rx1, ry1, pTam, pTam);
  if(rx1 >= 500){
    velrx1 = -2;
  } else if (rx1 <= 100){
    velrx1 = +2;
  }
  rx1 = rx1 + velrx1;
  }  

void pantallaInstrucciones(){
  // INSTRUCCIONES DE JUEGO
  fill(100);
  pushStyle();
  textSize(10);
  text("Click para jugar...", mouseX, mouseY);
  popStyle();
  pushStyle();
  textSize(20);
  textAlign(CENTER);
  text("Instrucciones de juego:", 300, 60);
  popStyle();
  textSize(15);
  text("Recolectar 10 bolitas azules esquivando los obstaculos naranjas \nque saldran desde los lados. \nSi uno de estos ultimos colisiona con tu personaje perderas una vida. \nTienes 3 vidas.", 60, 100);
  text("Controles: \nMover personaje con las flechas. \nCon un click se le indica hacia que lado comienza a moverse. \nEste permanecera en constante movimiento.", 60, 240);
  rectMode (CENTER);
  noStroke();
  fill(200);
  rect (rx1, height-pTam-5, pTam, pTam);
  if(rx1 >= 500){
    velrx1 = -2;
  } else if (rx1 <= 100){
    velrx1 = +2;
  }
  rx1 = rx1 + velrx1;
  
  
  }
  
  void pantallaGano(){
  pushStyle();
  textAlign(CENTER);
  textSize(40);
  text("Victoria!", 300, 150);
  popStyle();
  fill(0, 200, 0, 100);
  rectMode(CENTER);
  rect(300, 300, 150, 30);
  pushStyle();
  fill(50);
  textSize(15);
  textAlign(CENTER);
  text("Volver a jugar", 300, 305);
  popStyle();
}

void pantallaPerdio(){
  pushStyle();
  fill(255, 0, 0, 100);
  textAlign(CENTER);
  textSize(40);
  text("Derrota...", 300, 150);
  popStyle();
  fill(180);
  rectMode(CENTER);
  rect(300, 300, 150, 30);
  pushStyle();
  fill(50);
  textSize(15);
  textAlign(CENTER);
  text("Volver a jugar", 300, 305);
  popStyle();
  
  }
}
