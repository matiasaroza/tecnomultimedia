class Juego{
  //VARIABLES--------------------------------
  String estado;
  float tiempo1;
  Personaje personaje;
  Enemigos enemigo;
  Enemigos[] enemigos = new Enemigos[6];
  Enemigos enemigo1;
  Enemigos[] enemigos1 = new Enemigos[6];
  Enemigos enemigo2;
  Enemigos[] enemigos2 = new Enemigos[6];
  Objetivo bolita;
  Objetivo[] bolitas = new Objetivo[2];
  Pantallas pant;
  int contador;
  int vidas;
  int pantalla;
  
  
  //CONSTRUCTOR------------------------------
  Juego(){
    contador = 0;
    vidas = 3;
    estado = "pantalla intro";
    tiempo1 = 0;
    pant = new Pantallas();
    personaje = new Personaje();
    
    bolita = new Objetivo();
    for ( int i=0; i <bolitas.length; i++){
          bolitas [i] = new Objetivo(i);
        }
        
    enemigo = new Enemigos();
        for ( int i=0; i <enemigos.length; i++){
          enemigos [i] = new Enemigos(50+i*height/6);
        }
    enemigo1 = new Enemigos();
        for ( int i=0; i <enemigos1.length; i++){
          enemigos1 [i] = new Enemigos(50+i*width/6);
        }
    enemigo2 = new Enemigos();
        for ( int i=0; i <enemigos2.length; i++){
          enemigos2 [i] = new Enemigos(50+i*height/6);
        }    
  }
  
  
  //METODOS----------------------------------
  void dibujarJuego (){
     if(frameCount%60 == 0){
      tiempo1++;
    } 
    pant.dibujarPantallas(pantalla);
    if (estado.equals("pantalla intro")){
       pantalla = 0;
       pant.pantallaIntro();
     }
     
     if(estado.equals("ENTER")){
       pantalla = 1;
       pant.pantallaInstrucciones();
     }
     
      if(estado.equals("jugar")){
      pantalla = 2;
    personaje.dibujarPersonaje();
    personaje.moverPersonaje();
    bolita.dibujarObjetivo();
    bolita.moverObjetivo();
      for ( int i=0; i <bolitas.length; i++){
          bolitas[i].dibujarObjetivo();
          bolitas[i].moverObjetivo();
      }    
   
   if(tiempo1 > 0){
    enemigo.dibujarEnemigo();
    enemigo.moverEnemigo();
      for ( int i=0; i <enemigos.length; i++){
          enemigos[i].dibujarEnemigo();
          enemigos[i].moverEnemigo();
      }
   }
   
   if(tiempo1 > 8){
    enemigo1.dibujarEnemigo1();
    enemigo1.moverEnemigo1();
      for ( int i=0; i <enemigos1.length; i++){
          enemigos1[i].dibujarEnemigo1();
          enemigos1[i].moverEnemigo1();
      }
    }
      
  if(tiempo1 > 4){      
    enemigo2.dibujarEnemigo2();
    enemigo2.moverEnemigo2();
      for ( int i=0; i <enemigos2.length; i++){
          enemigos2[i].dibujarEnemigo2();
          enemigos2[i].moverEnemigo2();
      }
    }
      
     pushStyle();
     fill(0);
     textSize(20);
     textAlign(CENTER);
     text("Vidas = " + vidas, 400, 20);
     popStyle();
     pushStyle();
     fill(0);
     textSize(20);
     textAlign(CENTER);
     text("Puntos = " + contador, 150, 20);
     popStyle();     
     muerte();
     muerte1();
     muerte2();
     puntos();
      }
      
          if (vidas == 0){
      estado = "Perdiste";
    }
    if (contador == 10){
      estado = "Ganaste";
    }
    if (estado.equals("Perdiste")){
      pantalla = 3;
      pant.pantallaPerdio();
      text(" Perdiste, presiona ENTER para volver a empezar...", 100,550);
    }
    if(estado.equals("ENTER")){
      pantalla = 1;
    }
    if(estado.equals("Ganaste")){
      pantalla = 4;
      pant.pantallaGano();
    }
    if(estado.equals("pantalla intro")){
      pantalla = 0;
    }
  }
  
  
    void puntos(){
       float distancia = dist (personaje.posX, personaje.posY, bolita.ubiX1, bolita.ubiY1);
       if(distancia < personaje.pTam/2+bolita.bTam){
         contador ++;
         bolita.ubiX1 = random (10, 590);
         bolita.ubiY1 = random (10, 390);
         win.play();
       }
     for ( int i=0; i < 2; i++){
       float distan = dist (personaje.posX, personaje.posY, bolitas[i].ubiX1, bolitas[i].ubiY1);
       if(distan < personaje.pTam/2+bolitas[i].bTam){
         contador ++;
         bolitas[i].ubiX1 = random (10, 590);
         bolitas[i].ubiY1 = random (10, 390);
         win.play();
       }
     }
   }
   
     void muerte(){
     float distancia = dist (personaje.posX, personaje.posY,enemigo.ex,enemigo.ey );
    if(distancia<enemigo.etam/2+personaje.pTam/2){
    enemigo.atrapar();
    vidas --;
      }
      for ( int i=0; i <enemigos.length; i++){
    float distan = dist (personaje.posX, personaje.posY,enemigos[i].ex,enemigos[i].ey );
    if(distan<enemigos[i].etam/2+personaje.pTam/2){
    enemigos[i].atrapar();
    vidas --;
      }
     }
    }

     void muerte1(){
     float distancia = dist (personaje.posX, personaje.posY,enemigo1.ex1,enemigo1.ey1 );
    if(distancia<enemigo1.etam1/2+personaje.pTam/2){
    enemigo1.atrapar();
    vidas --;
      }
      for ( int i=0; i <enemigos1.length; i++){
    float distan = dist (personaje.posX, personaje.posY,enemigos1[i].ex1,enemigos1[i].ey1 );
    if(distan<enemigos1[i].etam1/2+personaje.pTam/2){
    enemigos1[i].atrapar();
    vidas --;
      }
     }
    }
  
     void muerte2(){
     float distancia = dist (personaje.posX, personaje.posY,enemigo2.ex2,enemigo2.ey2 );
    if(distancia<enemigo2.etam2/2+personaje.pTam/2){
    enemigo2.atrapar();
    vidas --;
      }
      for ( int i=0; i <enemigos2.length; i++){
    float distan = dist (personaje.posX, personaje.posY,enemigos2[i].ex2,enemigos2[i].ey2 );
    if(distan<enemigos2[i].etam2/2+personaje.pTam/2){
    enemigos2[i].atrapar();
    vidas --;
      }
     }
    }
      
            
    
   void comienzo(){
     if(pantalla == 0){
    estado = "ENTER";
    pantalla = 1; 
        
      } else if (pantalla == 1){
        estado = "jugar";
        pantalla = 2;
    
      } else if (pantalla==3) {
      // ESTADO PERDISTE
      if(mouseX >= 225 && mouseX <= 375 && mouseY >= 285 && mouseY <= 315){
        estado = "pantalla intro";
        pantalla = 0;
        tiempo1 = 0;
        vidas = 3;
        contador = 0;
      personaje = new Personaje();
    
    enemigo = new Enemigos();
     for ( int i=0; i <enemigos.length; i++){
       enemigos [i] = new Enemigos(50+i*height/6);
        }
        
    enemigo1 = new Enemigos();
     for ( int i=0; i <enemigos1.length; i++){
       enemigos1 [i] = new Enemigos(50+i*width/6);
        }
        
    enemigo2 = new Enemigos();
     for ( int i=0; i <enemigos2.length; i++){
       enemigos2 [i] = new Enemigos();
        }
        
      }
      
    } else if (pantalla==4) {
    // ESTADO GANASTE
    if(mouseX >= 225 && mouseX <= 375 && mouseY >= 285 && mouseY <= 315){
      estado = "pantalla intro";
      pantalla = 0;
      tiempo1 = 0;
      vidas = 3;
      contador = 0;
      personaje = new Personaje();
    
      enemigo = new Enemigos();
       for ( int i=0; i <enemigos.length; i++){
         enemigos [i] = new Enemigos(50+i*height/6);
        }
        
       enemigo1 = new Enemigos();
       for ( int i=0; i <enemigos1.length; i++){
         enemigos1 [i] = new Enemigos(50+i*width/6);
        }
        
      enemigo2 = new Enemigos();
       for ( int i=0; i <enemigos2.length; i++){
         enemigos2 [i] = new Enemigos();
        }
      }
    }
  }
}
