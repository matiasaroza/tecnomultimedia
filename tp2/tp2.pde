//  https://youtu.be/acqQr-ALyls  /// Vinculo al Video explicativo
int cant =  9 ;
int ubic;
float tam;
 void setup () {
  size (800 , 800);
  surface.setResizable ( true );
}
void draw() {
  background (0, 255, 223);
  ubic =  width/cant;
  for (int x=0 ; x<cant; x++ ) {
    for (int y=0 ; y<cant; y++ ) {
      float distan =  dist ( mouseX , mouseY , x*ubic+ubic/2, y*ubic+ubic/2);
      tam =  map (distan, 0, dist(0, 0, width, height), 10, ubic*4);
      
      float tono =  map (distan, 0, dist ( 0, 0, width, height), 255, 50);
      if ((x + y)%2 == 0 ) {
        fill (255, 0, 0, tono);
      } else if(mousePressed) {
        fill (0, tono);
      } else {
       fill (0);
      }
  
      float borde =  map (distan, 0, dist ( 0, 0, width, height), 255, 0);
      strokeWeight ( 6 );
      stroke (borde, 0, borde);
      
      ellipse (x*ubic+ubic/2, y*ubic+ubic/2, tam, tam);
    }
  }
}
 void keyPressed() {
    if(keyCode  ==  ENTER ){
     mouseX = width/2;
     mouseY = height/2;
    }
 }
