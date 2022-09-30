class Cuervo1 {
  //VARIABLES---------------------
  float cx1, cy1, ctam1, cvel;
  float nx, ny, ntam, nvel;
  PImage nubes;
  boolean cuervoMalo, Nube;
  
  //CONSTRUCTOR-------------------
  Cuervo1() {
    ctam1 = random(30, 50); 
    cx1 =random(width+width/2, width+ctam1); 
    cy1 = random(50, height-50);
    cvel = random(2, 4);
    ntam = random(30, 50);
    nx =random(width+width/2, width+ntam); 
    ny = random(50, height-50);
    nvel = random(2, 4);
    nubes = loadImage("nube.png");
    cuervoMalo = false;
    Nube = false;
  }
  

  Cuervo1(float pny) {
    ctam1 = random(30, 50); 
    cx1 =random(width+width/2, width+ctam1); 
    cy1 = pny;
    cvel = random(2, 4);
    ntam = random(30, 50);
    nx =random(width+width/2, width+ntam); 
    ny = pny;
    nvel = random(2, 4);
    nubes = loadImage("nube.png");
    cuervoMalo = false;
    Nube = false;
  }
  
  //METODOS-------------------------
  void dibujarCuervo1() {

    fill(0);
    triangle(cx1-ctam1, cy1, cx1+ctam1, cy1, cx1, cy1+ctam1/2);
  }
  
    void moverCuervo1() {
    if (cx1<0 || cuervoMalo ) { 
      cx1 =random(width+width/2, width+ctam1); 
      ctam1 = random(30, 50);
      cvel = random(2, 4);
      cuervoMalo = false;
    }
    cx1-=cvel;
  }
  
  void dibujarNube(){
    push();
   noFill();
   noStroke();
   rectMode(CENTER);
   rect(nx, ny, ntam, ntam/2);
   imageMode(CENTER);
   image(nubes, nx, ny, ntam, ntam/2);
   pop();


  }
  void moverNube() {
    if (nx<-width-ntam || Nube ) { 
      nx =random(width+width/2, width+ntam); 
      ntam = random(30, 50);
      nvel = random(2, 4);
      Nube = false;
    }
    nx-=nvel;
  }
  void atrapar() {
    cuervoMalo = true;
  }
  
  void sumar(){
   Nube = true;
  }
}
