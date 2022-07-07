int rx1 = 100, ry1 = 200, velrx1 = 2; 

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

void volveraPantallaInicio(){
  estado = 0;
}
