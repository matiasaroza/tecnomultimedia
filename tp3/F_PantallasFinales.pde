void pantallaGano(){
  background(255);
  pushStyle();
  textAlign(CENTER);
  textSize(40);
  text("Victoria!", 300, 120);
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
  background(255);
  pushStyle();
  fill(255, 0, 0, 100);
  textAlign(CENTER);
  textSize(40);
  text("Derrota...", 300, 120);
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
