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
