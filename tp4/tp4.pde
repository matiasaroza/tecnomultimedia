//Aroza Matias - Legajo 88281/1 - Comision 3
//Link a Youtube: https://youtu.be/VUjEK1gPaCo
Juego juego;
void setup(){
  size(800, 600);
  juego = new Juego();
}

void draw(){
  juego.dibujarJuego();
  juego.moverPersonaje();
}

void keyPressed(){
  juego.comienzo(keyCode);
 }
