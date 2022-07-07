float posX = 300, posY = 200, pTam = 25;

void personaje(){
  // LIMITES DE MOVIMIENTO
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
  
  // PERSONAJE
  rectMode (CENTER);
  noStroke();
  fill(200);
  rect (posX, posY, pTam, pTam);
  
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

float [] ubiX1 = {120, 480};  //posicion inicial bola x1 
float [] ubiY1 = {300, 100};  //posicion inicial bola y1
int bTam = 8, tiempo = 60*10;

void objetivo() {
  // DIBUJAR BOLITAS 1
  for (int i = 0; i < 2; i++ ){     
    strokeWeight(1);
    fill(0, 0, 255);
    ellipse (ubiX1 [i], ubiY1 [i] , bTam, bTam);
  }
  //CAMBIO DE POSICION DE BOLITAS 1
  if (frameCount%tiempo == 0) {
    for (int i = 0; i < 2; i++ ){ 
  ubiX1 [i] = random (10, 590);
  ubiY1 [i] = random (100, 390);
  }    
 }
}

float tiempo1 = 0;
float etam = random(7, 10), ex = -etam, ex2 = width+etam, ey = -etam, evel = random(2, 4);
float [] ey1 = {random(30, 60), random(65, 130), random(135, 200), random(205, 265), random(270,330), random(335,400) };
float [] ex1 = {random(0, 100), random(105, 205), random(210, 310), random(315, 415), random(420,520), random(525,600)};
float [] ey3 = {random(30, 60), random(65, 130), random(135, 200), random(205, 265), random(270,330), random(335,400) };

void enemigos(){
// EnemigosIZQ
  if(tiempo1 > 0){
//DIBUJAR ENEMIGOS 
  for(int c1 = 0; c1 < 6; c1++){
   fill(255, 150, 0);
   rect(ex, ey1 [c1], etam, etam*1);
    if(colisionCoorSupRectangulares(ex , ey1 [c1], etam/2, etam/2, posX, posY, pTam/2, pTam/2)){
      vidas--;
      ex  = -etam;
      etam = random(7, 10);
      evel = random(2, 4);
      ey1 [c1] = random (40, 400);
    }
  }  
//GUARDAR EN MEMORIA VALORES DE EY
  if(ex>width+etam){
    for(int c1 = 0; c1 < 6; c1++){
      ey1 [c1] = random (40, 400);
    }
  }  
//VOLVER A VALORES INICIALES
 if (ex>width+etam) {
   ex  = -etam;
   etam = random(7, 10);
   evel = random(2, 4);
 }
 ex+=evel;
}


// EnemigosDER
  if(tiempo1 > 7.5){
//DIBUJAR ENEMIGOS 
  for(int c = 0; c < 6; c++){
   fill(255, 150, 0);
   rect(ex2, ey3 [c], etam, etam*1);
    if(colisionCoorSupRectangulares(ex2 , ey3 [c], etam/2, etam/2, posX, posY, pTam/2, pTam/2)){
      vidas--;
      ex2  = width+etam;
      etam = random(7, 10);
      evel = random(2, 4);
      ey3 [c] = random (40, 400);
    }
  } 
//GUARDAR EN MEMORIA VALORES DE EY
  if(ex2<-width-etam){
    for(int c = 0; c < 6; c++){
      ey3 [c] = random (40, 400);
    }
  }
//VOLVER A VALORES INICIALES
 if (ex2<-width-etam) {
   ex2 = width+etam;
   etam = random(7, 10);
   evel = random(2, 4);
 }
   ex2-=evel;
}


// EnemigosARRIBA 
  if(tiempo1 > 4.25){
//DIBUJAR ENEMIGOS 
  for(int c = 0; c < 6; c++){
   fill(255, 150, 0);
   rect(ex1 [c], ey+50, etam, etam);
    //CONTACTO 
    if(colisionCoorSupRectangulares(ex1 [c], ey+50, etam/2, etam/2, posX, posY, pTam/2, pTam/2)){
      vidas--;
      ey  = -etam;
      etam = random(7, 10);
      evel = random(2, 4);
      ex1 [c] = random (0, 600); 
  }
 }  
//GUARDAR EN MEMORIA VALORES DE EY
  if(ey>height+etam){
    for(int c = 0; c < 6; c++){
      ex1 [c] = random (0, 600);
    }
  }
//VOLVER A VALORES INICIALES
 if (ey>height+etam) {
   ey  = -etam;
   etam = random(7, 10);
   evel = random(2, 4);
  }
 ey+=evel;
 }
}


void puntos(){
  for ( int i=0; i < 2; i++){
    float distancia = dist (posX, posY, ubiX1[i], ubiY1[i]);
    if(distancia < pTam/2+bTam){
      contador ++;
      ubiX1 [i] = random (10, 590);
      ubiY1 [i] = random (10, 390);
    }
   }
   pushStyle();
   fill(0);
   textSize(20);
   textAlign(CENTER);
   text("Puntos = " + contador, 150, 20);
   popStyle();
}



void vidas(){
   pushStyle();
   fill(0);
   textSize(20);
   textAlign(CENTER);
   text("Vidas = " + vidas, 400, 20);
   popStyle();
}
