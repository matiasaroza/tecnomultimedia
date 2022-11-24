class Enemigos {
  //VARIABLES---------------------
  float ex, ey, etam, evel;
  float ex1, ey1, etam1, evel1;
  float ex2, ey2, etam2, evel2;
  boolean Malo;
  
  //CONSTRUCTOR-------------------
  Enemigos() {
    //IZQUIERDA
    etam = random(7, 15); 
    ex =random(0-width/2, 0-etam); 
    ey = random(50, height-50);
    evel = random(2, 4);    
    //ARRIBA
    etam1 = random(7, 15); 
    ex1 =random(50, width-50); 
    ey1 = random(0-height/2, 0-etam1);
    evel1 = random(2, 4);
    //DERECHA
    etam2 = random(7, 15); 
    ex2 =random(width+width/2, width+etam2); 
    ey2 = random(50, height-50);
    evel2 = random(2, 4);    

    Malo = false;

  }
  

  Enemigos(float pny) {
    //IZQUIERDA
    etam = random(7, 15); 
    ex =random(0-width/2, 0-etam); 
    ey = random(50, height-50);
    evel = random(2, 4);    
    //ARRIBA
    etam1 = random(7, 15); 
    ex1 =random(50, width-50); 
    ey1 = random(0-height/2, 0-etam1);
    evel1 = random(2, 4);
    //DERECHA
    etam2 = random(7, 15); 
    ex2 =random(width+width/2, width+etam2); 
    ey2 = random(50, height-50);
    evel2 = random(2, 4);  
    
    Malo = false;

  }
  
  //METODOS-------------------------
  void dibujarEnemigo() {
    
   fill(255, 150, 0);
   rect(ex, ey, etam, etam*1);

  }
  
  void dibujarEnemigo1() {
    
   fill(255, 150, 0);
   rect(ex1, ey1, etam1, etam1*1);

  }
  
  void dibujarEnemigo2() {
    
   fill(255, 150, 0);
   rect(ex2, ey2, etam2, etam2*1);

  }
  
    void moverEnemigo() {
    if (ex>width || Malo ) { 
      ex =random(0-width/2, 0-etam); 
      etam = random(7, 10);
      evel = random(2, 4);
      Malo = false;
    }
    ex+=evel;
  }
  
    void moverEnemigo1() {
    if (ey1>height || Malo ) { 
      ey1 =random(0-height/2, 0-etam2); 
      etam1 = random(7, 10);
      evel1 = random(2, 4);
      Malo = false;
    }
    ey1+=evel;
  }
  
    void moverEnemigo2() {
    if (ex2<0 || Malo ) { 
      ex2 =random(width+width/2, width+etam2); 
      etam2 = random(7, 10);
      evel2 = random(2, 4);
      Malo = false;
    }
    ex2-=evel;
  }
  
  void atrapar() {
    Malo = true;
  }

}
