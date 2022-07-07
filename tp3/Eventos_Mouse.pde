void mousePressed (){
if ( estado==0) {
  // INICIO
  cambiarAEstadoIntro();
  
  } else if (estado==1) {
    // ESTADO INTRO
    cambiarAEstadoJugando();

  } else if (estado==2) {
    // ESTADO JUGANDO
    cambiarAEstadoGanaste();
    cambiarAEstadoPerdiste();
    
  } else if (estado==3) {
    // ESTADO GANASTE
    cambiarAEstadoInicio();
    
  } else if (estado==4) {
    // ESTADO PERDISTE
    cambiarAEstadoInicio();
  }
}
