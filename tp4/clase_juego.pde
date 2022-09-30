class Juego{
  //VARIABLES--------------------------------
  String estado;
  Globo personaje;
  Cuervo1 nube;
  Cuervo1[] nubes = new Cuervo1[8];
  Cuervo1 cuervo;
  Cuervo1[] cuervos = new Cuervo1[8];
  Pantallas pant;
  int pincha;
  int esquivadas = 0;
  int vidas = 3;
  int pantalla;
  
  
  //CONSTRUCTOR------------------------------
  Juego(){
    estado = "pantalla principal";
    pant = new Pantallas();
    personaje = new Globo();
    cuervo = new Cuervo1();
    nube = new Cuervo1();
    textSize(25);
        for ( int i=0; i <cuervos.length; i++){
          cuervos [i] = new Cuervo1(50+i*height/6);
        }
        
        for ( int i=0; i <nubes.length; i++){
          nubes [i] = new Cuervo1(50+i*height/6);
        }
  }
  
  
  //METODOS----------------------------------
  void dibujarJuego (){
    pant.dibujarPantallas(pantalla);
    if (estado.equals("pantalla principal")){
       pantalla = 0;
       fill(0);
       text("Presiona ENTER para comenzar el juego...",100, 500);
     }
     
     if(estado.equals("ENTER")){
       pantalla = 1;
     }
     
      if(estado.equals("jugar")){
      pantalla = 1;
    personaje.dibujarGlobo();
    cuervo.dibujarCuervo1();
    cuervo.moverCuervo1();
    cuervo.dibujarNube();
    cuervo.moverNube();
      for ( int i=0; i <cuervos.length; i++){
          cuervos[i].dibujarCuervo1();
          cuervos[i].moverCuervo1();
      }
      for ( int i=0; i <nubes.length; i++){
          nubes[i].dibujarNube();
          nubes[i].moverNube();
      }
      push();
      fill(0);
      textAlign(CENTER, CENTER);
      text("Vidas="+vidas,width/4,height-50);
      textAlign(CENTER, CENTER);
      text("Atrapadas="+esquivadas,600,height-50);
      pop();
      globoPincho();
      esquivar();
      }
      
          if (vidas == 0){
      estado = "Perdiste";
    }
    if (esquivadas == 20){
      estado = "Ganaste";
    }
    if (estado.equals("Perdiste")){
      pantalla = 3;
      text(" Perdiste, presiona ENTER para volver a empezar...", 100,550);
    }
    if(estado.equals("ENTER")){
      pantalla = 1;
    }
    if(estado.equals("Ganaste")){
      pantalla = 2;
      text(" Ganaste, presiona botón ENTER para volver a jugar...", 100,550);
    }
    if(estado.equals("UP")){
      pantalla = 0;
    }
  }
  
  void moverPersonaje(){
     personaje.moverPersonaje();
   }
   
   void globoPincho(){
     float distancia = dist (personaje.px, personaje.py,cuervo.cx1,cuervo.cy1 );
    if(distancia<cuervo.ctam1/2+personaje.ptam/2){
    cuervo.atrapar();
    vidas --;
      }
      for ( int i=0; i <cuervos.length; i++){
    float distan = dist (personaje.px, personaje.py,cuervos[i].cx1,cuervos[i].cy1 );
    if(distan<cuervos[i].ctam1/2+personaje.ptam/2){
    cuervos[i].atrapar();
    vidas --;
      }
     }
    }
    
   void esquivar(){
     float distancia = dist (personaje.px, personaje.py,nube.nx,nube.ny );
    if(distancia<nube.ntam/2+personaje.ptam/2){
    nube.sumar();
    esquivadas++;
      }
      for ( int i=0; i <cuervos.length; i++){
    float distan = dist (personaje.px, personaje.py,nubes[i].nx,nubes[i].ny );
    if(distan<nubes[i].ntam/2+personaje.ptam/2){
    nubes[i].sumar();
    esquivadas++;
      }
     }
     
      }
      
            
    
   void comienzo(int k){
     if(k ==ENTER && estado != "jugar"){
    estado = "jugar";
    pantalla = 1;
    vidas = 3;
    esquivadas = 0;
    personaje = new Globo();
    cuervo = new Cuervo1();
    nube = new Cuervo1();
     for ( int i=0; i <cuervos.length; i++){
       cuervos [i] = new Cuervo1();
        }
        for ( int i=0; i <nubes.length; i++){
       nubes [i] = new Cuervo1();
        }
       }
     }
   }
