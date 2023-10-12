import processing.sound.*;

import fisica.*;
import oscP5.*;

OscP5 osc;

//float movimiento = 0; //movimiento de la app

SoundFile soundMusica, soundArco, soundFlecha, soundImpacto;

PImage fondo, archer, wachito, imgManzana, flechita, gana, pierde;

int cant=3;
PImage instr[] = new PImage [cant];
int orden;

float amortiguacion = 0.9;
float umbralDistancia = 60;

PVector indice;
PVector pulgar;
PVector medio;
PVector anular;
PVector menique;
PVector palma;

PVector puntero;

boolean seTocan = false;
boolean antesSeTocaban = false;

boolean down = false;
boolean up = false;

float posX, posY;
float initPosX = 0;

int cantT= 5;
boolean cantidadTiros= false;

FWorld mundo;
Flecha flecha;

FBox e;
String estado;
int pantalla;

void setup() {
  size( 1000, 600 );

  Fisica.init(this);

  textFont( createFont("Arial", 72) );
  textAlign( CENTER, CENTER );

  fondo = loadImage ("fondo.png");
  archer = loadImage ("archero.png");
  wachito = loadImage ("wachito.png");
  flechita = loadImage ("flechita.png");
  gana = loadImage ("Pvictoria.jpg");
  pierde =loadImage ("Pderrota.jpg");

  //carga img de las instrucciones del inicio
  for (int i = 0; i<cant; i ++) {
    instr [i] = loadImage ("Pinicioa" +i+ ".jpg");
  }

  //cargamos sonidos
  soundMusica = new SoundFile (this, "musica.mp3");
  soundArco = new SoundFile (this, "arco.mp3");
  soundFlecha = new SoundFile (this, "flecha.mp3");
  soundImpacto = new SoundFile (this, "impacto.mp3");


  iniciar();
  soundMusica.amp (0.1);
  soundMusica.loop();

  //inicializar osc
  osc = new OscP5(this, 8008);

  indice = new PVector(0, 0);
  pulgar = new PVector(width/2, height/2);
  puntero = new PVector (0, 0);

  e = new FBox (120, 80);
  e.setNoFill();
  e.setNoStroke();
  e.setPosition (width-100, height-70);
  e.setName ("enemy");
  e.setStatic(true);
  mundo.add (e);

  println(indice);
  println(pulgar);
}


void draw() {
  background(0);

  //Control del hand pose-----------------------------------------------
  seTocan = dist(pulgar.x, pulgar.y, indice.x, indice.y) < umbralDistancia;

  println(dist(pulgar.x, pulgar.y, indice.x, indice.y) );

  down = !antesSeTocaban && seTocan;
  up = antesSeTocaban && !seTocan;

  if (down) println("DOWN");
  if (up) println("UP");

  puntero.x =  lerp(pulgar.x, indice.x, 0.1);
  puntero.y =  lerp(pulgar.y, indice.y, 0.1);

  if (down) {
    initPosX = puntero.x;
    //println(" ORIGEN PUNTERO: " + posX );
  }
  posX = 10 - (initPosX - puntero.x);
  posY = puntero.y;


  if (down) flecha.estirar();
  if (up) flecha.disparar();


  //Imagenes del inicio-----------------------------------------------por tiempo
  /*if ( estado.equals("inicia") )  {
   image (instr[orden], 0, 0, 1000, 600);
   if (frameCount%30==0) {
   if (orden<cant-1) {
   orden++;
   }
   }
   }*/


  //Imagenes del inicio-----------------------------------------------con la mano
  if ( estado.equals("inicia") ) {
    image (instr[0], 0, 0, 1000, 600);
    if (seTocan = dist(pulgar.x, pulgar.y, indice.x, indice.y) < umbralDistancia) {
      image (instr[1], 0, 0, 1000, 600);
    } else if (up) {
      image (instr[2], 0, 0, 1000, 600);
      estado = "juega";
    }
  }

  //ESTADOS-----------------------------------------------
  if ( estado.equals("juega") ) {
    image (fondo, 0, 0, 1000, 600);
    image (archer, 20, height-220, 180, 200);/////////////////////////////////////
    image (wachito, width-190, height-170, 150, 150);
    flecha.actualizar();
    mundo.step();
    mundo.draw();
    flecha.dibujar();
  } else if (estado.equals("ganaste")) {
    image (gana, 0, 0, 1000, 600);
  } else if (estado.equals("perdiste")) {
    image (pierde, 0, 0, 1000, 600);
  }

  println(estado);

  antesSeTocaban = seTocan;
}


//Colisiones
void contactStarted(FContact choque) {
  if ( estado.equals( "juega" ) ) {
    if ( hayColisionEntre( choque, "flecha", "apple" ) ) {
      estado = "ganaste";
      soundImpacto.play();
    }
  }

  if ( estado.equals( "juega" ) ) {
    if ( hayColisionEntre( choque, "flecha", "enemy" ) ) {
      if (!cantidadTiros) {
        cantT--;
        cantidadTiros=true;
        estado = "perdiste";
        soundImpacto.play();
      }
      if (cantT==0) {
        estado = "perdiste";
      }
    }
  }
}


void oscEvent(OscMessage m) {

  //println(m);

  if (m.addrPattern().equals("/annotations/thumb")) {
    pulgar.x = map( m.get(9).floatValue(), 800, 0, 0, width );
    pulgar.y = map( m.get(10).floatValue(), 600, 0, height*2, 0 );
  }
  if (m.addrPattern().equals("/annotations/indexFinger")) {
    indice.x = map( m.get(9).floatValue(), 800, 0, 0, width );
    indice.y = map( m.get(10).floatValue(), 600, 0, height*2, 0 );
  }
}
