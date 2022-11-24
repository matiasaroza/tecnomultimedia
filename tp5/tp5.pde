//Matias Aroza - Comision 3 - Legajo 88281/1
//LINK AL VIDEO EXPLICATIVO: https://youtu.be/lUl6TNhxk3c
  
  Juego juego;
  import processing.sound.*;
  SoundFile win;

void setup(){
  size(600, 400);
  juego = new Juego();
  win = new SoundFile(this, "win.wav");

}

void draw(){
  juego.dibujarJuego();
}

void mousePressed(){
  juego.comienzo();
 }
