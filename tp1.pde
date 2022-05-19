PFont fuente1, otra;
PImage fondo, salpicadura, brad, malo, paracaidas, misil; 
float px, px2, px3, px4, py, py2, py3, py4;
int posypara, posymisil;
boolean seMueve;
float opac, boton;
void setup(){
  size(800, 600);
  seMueve =  true ;
  misil = loadImage("misil.png");
  paracaidas = loadImage("Paracaidas.png");
  malo = loadImage("malo.png");
  brad = loadImage("brad.png");
  salpicadura = loadImage("salpicaduraok.png");
  fondo = loadImage("fondo.jpg");
  fuente1 = loadFont("temaok.vlw");
  otra = createFont("fuentedemierda.ttf", 42);
  py2 = 350;
  px2 = 850;
  py3 = 200;
  px3 = 200;
  px4 = 850;
  posypara = -250;
  posymisil = -250;
  boton = random(200);
  
}


void draw() { 
  background(0);
  image(fondo, 0, 0, width, height);
  
  py++;
 if (frameCount <=600) { 
  if(py <= 150){
   opac = map(py, 0, 150, 0, 255);
  fill(0, opac);
  textFont(fuente1);
  textSize(40);
  text("UNIVERSAL PICTURES", 400, 300);
  textSize(30);
  textAlign(CENTER);
  text("PRESENTS", 400, 350);
  } else if (py >= 150 && py <= 300) {
    opac = map(py, 150, 300, 255, 0);
  fill(0, opac);
  textFont(fuente1);
  textSize(40);
  text("UNIVERSAL PICTURES", 400, 300);
  textSize(30);
  textAlign(CENTER);
  text("PRESENTS", 400, 350);
  } else if (py >= 300 && py<= 450){
    opac = map(py, 300, 450, 0, 255);
  fill(0, opac);
  textFont(fuente1);
  textSize(40);
  text("Lawrence Bender", 400, 300);
  textSize(25);
  textAlign(CENTER);
  text("productions", 400, 350);
  } else {
    opac = map(py, 450, 600, 255, 0);
  fill(0, opac);
  textFont(fuente1);
  textSize(40);
  text("Lawrence Bender", 400, 300);
  textSize(25);
  textAlign(CENTER);
  text("productions", 400, 350);
  }
    
    }

if (frameCount >= 600  && frameCount <= 820) {
  
  if(py >= 650) {
    image(salpicadura, 200, 150, 850, 850); 
  }

  fill(0);
  textFont(fuente1);
  text("A ", 100, 100);
  text("   film", 100, 150);
  
  textFont(fuente1);
  textSize(40);
  text("by", 165, 180);
  
 if(py >= 690){ 
  image(paracaidas, 0, posypara, 400, 400);
  posypara += 6;
 }
  fill(255);
  textFont(otra);
  text("Quentin Tarantino", px, py2);
  
  if (seMueve ==  true ) { 
    px += 20 ;
  }
  
  if ( frameCount > 620   &&  frameCount <= 750 ) { 
    seMueve =  false;
    px += 0.1;
  } else {
   seMueve = true; 
  }
  

}

///////PANTALLA 4////////

if (frameCount >= 850 && frameCount <= 1050) {
  
    if(py >= 860 && py <= 1040) {
    image(salpicadura, 300, 100, 850, 850); 

  fill(0);
  textFont(fuente1);
  textSize(50);
  text("Director ", 200, 500);
  text("       of photography", 230, 550);
   
  }
  
   if(py >= 900){ 
  image(misil, 450, posymisil, 300, 300);
  posymisil += 6;
 }
  
  fill(255);
  textFont(otra);
  text("Robert Richardson", px2, py3);
  
  if (seMueve ==  true ) { 
    px2 -= 20 ;
  }
   
  if ( frameCount > 875   &&  frameCount <= 990 ) { 
    seMueve =  false;
    px2 -= 0.1; 
  } else {
   seMueve = true; 
  }

}

///PANTALLA 5////

if (frameCount >= 1070 && frameCount <= 1260) {
  
    if(py >= 1080 && py <= 1250) {
    image(salpicadura, -180, -100, 720, 720);
    imageMode(CORNERS);
    image(brad, 250, 50, 800, 600);
  }
  
  fill(255);
  textFont(otra);
  text("Brad Pitt", px3, py4);
  
  if (seMueve ==  true ) { 
    py4 += 25 ;
  }
   
  if ( frameCount > 1090   &&  frameCount <= 1208 ) { 
    seMueve =  false;
    py4 += 0.1; 
  } else {
   seMueve = true; 
  }

}

////PANTALLA 6////


if (frameCount >= 1290 && frameCount <= 1490) {
  
    if(py >= 1310 && py <= 1470) {
      imageMode(CORNERS);
      image(salpicadura, 300, 150, 900, 700);
      
      image(malo, 0, 0, 600, 600);
  }
  
  fill(255);
  textFont(otra);
  text("Christoph Waltz", px4, py3);
  
  if (seMueve ==  true ) { 
    px4 -= 20 ;
  }
   
  if ( frameCount > 1312   &&  frameCount <= 1430 ) { 
    seMueve =  false;
    px4 -= 0.1; 
  } else {
   seMueve = true; 
  }

}

/////PANTALLA 7////

  if (frameCount >= 1510 && frameCount <= 1960) { 
    
    fill(0);
      textFont(fuente1);
      textSize(opac);
      text("INGLOURIOUS", 400, 300);
      textSize(opac);
      textAlign(CENTER);
      text("BASTERDS", 400, 350);
      
    if(py >= 1500 && py <= 1700){
      opac = map(py, 1500, 1700, 200, 70);
    } else {
     opac = 70; 
    }

  }
  if(py >1800){
    fill(boton);
  ellipse(700, 500, 100, 100);
  }
  println(py);
  println(mouseX);
  println(frameCount);
}

  
  void mousePressed() {
    if(mouseX >= 650 && mouseX <=750 && mouseY >= 450 && mouseY <= 550 ){
      py = 0;
      frameCount = 0;
       py2 = 350;
       px2 = 850;
      py3 = 200;
      px3 = 200;
      px4 = 850;
      px = 0;
      py4 = 0;
      posypara = -250;
      posymisil = -250;
    }
  
  
}
