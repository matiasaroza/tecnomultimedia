//https://youtu.be/7M_kl7B1s4c

//AROZA MATIAS, COM 3, LEGAJO: 88281/1

int estado = 0;

void setup() {
  size (600, 400);
}

void draw() {
  background(255);
  if ( estado == 0) {
    // PANTALLA DE INICIO
    background(255);
    pantallaIntro();
    
  } else if ( estado== 1) {
    // INSTRUCCIONES
    background(255);
    pantallaInstrucciones();
    
  } else if ( estado== 2) {
    // ESTADO JUGANDO
    background(255);
    jugando();
    
  } else if (estado == 3) {
    // GANO
    background(255);
    pantallaGano();
    
  } else if (estado == 4) {
    // PERDIO
    background(255);
    pantallaPerdio();
  }
}
