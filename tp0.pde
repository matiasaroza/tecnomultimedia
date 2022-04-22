PFont fuente;
int ojos = 165;
void setup(){
  size (400, 400);
  fuente = loadFont ("BodoniMTCondensed-48.vlw");
}
void draw(){
  background (0, 195, 210);
  noStroke ();
  fill(0, 108, 20, 255);
  ellipse (270, 300, 70, 70);
  fill(0, 108, 20, 210);
  ellipse (330, 270, 70, 70);
  fill(0, 108, 20, 210);
  ellipse (300, 250, 60, 60);
  fill(0, 108, 20, 180);
  ellipse (360, 230, 80, 80);
  fill(0, 108, 20, 160);
  ellipse (320, 190, 80, 80);
  fill(0, 108, 20, 130);
  ellipse (380, 170, 95, 95);
  fill(0, 108, 20, 110);
  ellipse (310, 120, 95, 95);
  fill(0, 108, 20, 90);
  ellipse (385, 80, 115, 115);
  fill(0, 108, 20, 90);
  ellipse (280, 30, 130, 130);
  fill(0, 108, 20, 60);
  ellipse (385, -20, 140, 140);
  fill(0, 0, 0); 
  quad(0, 300, 170, 250, 340, 300, 170, 500);
  ellipse (170, 200, 200, 300);
  fill(225, 125, 255); 
  noStroke();
  ellipse (170, 190, 200, 200);

  stroke (255, 255, 255);
  strokeWeight (10);
  point (270, 185);
  point (70, 185);
  
  fill (255, 255, 255, 200);
  strokeWeight  (2);
  ellipse (120, ojos, 40, 30);
  ellipse (220, ojos, 40, 30);
  
 /* ojos = ojos +1;
  if (ojos > 210) {
    ojos = 160;
  } */
  textFont (fuente);
  textSize (80);
  text ("Matias", 10, 390);
}
