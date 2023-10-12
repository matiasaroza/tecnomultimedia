class Flecha extends FBox {

  String estado;
  float xOriginal = 160;
  float yOriginal = 465;
  long marca;
  int tiempo = 3000;//espera de 5 segundos
  int cant= 5;

  Flecha() {
    //llamando al constructor de la clase madre ( FCircle )
    super(30, 40);
    setFill(250);
    //configura el rebote (entre 0 y 1)
    setRestitution(0.1);
    //configura la masa
    setDensity(100);
    //configuro el nombre
    setName("flecha");
    reiniciar();
    estado = "inicia";
    // flecha.attachImage(flechita);
  }

  void reiniciar() {
    estado = "inicia";
    //el proyectil no responde a las fuerzas
    setStatic(true);
    //pongo la velocidad en 0
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( xOriginal, yOriginal );
  }

  void actualizar() {
    if ( estado.equals("inicia") ) {
      //sigo al mouse en Y para definir la altura
      setPosition( xOriginal, yOriginal );
    } else if ( estado.equals("estira") ) {
    } else if ( estado.equals("movimiento") ) {
      long ahora = millis();
      //calcula que desde el momento que disparé pasaron 5 segundos
      if ( ahora>marca+tiempo ) {
        setStatic(true);
        setVelocity(0, 0);
        setPosition( xOriginal, yOriginal );
        cant--;
        estado = "inicia";
      }
    }
  }

  void click() {
    if ( estado.equals("inicia") ) {
      estado = "estira";
    } else if ( estado.equals("estira") ) {
      disparar();
    }
  }

  void estirar() {
    if ( estado.equals("inicia") ) {
      estado = "estira";
      soundArco.amp(0.2);
      soundArco.play();
    }
  }


  void dibujar() {
    if ( estado.equals("estira") ) {
      line( getX(), getY(), posX, posY );

      if (posX >=0 || posX <= 0) {
        fill (0, 255, 0);
        rect (getX(), getY(), -posX/4, 10);
      }
      if (posX <= -80) {
        fill (255, 255, 0);
        rect (getX(), getY(), -posX/4, 10);
      }
      if (posX <= -100) {
        fill (255, 0, 0);
        rect (getX(), getY(), -posX/4, 10);
      }
    }
    fill(0);
    textSize(25);
    text("Tiros restantes: " + cant, 150, 50);
  }

  void disparar() {
    if (estado.equals("estira")) {
      soundFlecha.amp(0.2);
      soundFlecha.play();
      //lo hago disponible para aplicar fuerzas
      setStatic( false );
      float fuerza = 8;
      //defino el vector de fuerza
      float dx = getX()-posX;
      float dy = getY()-posY;
      //aplico movimiento en función del vector definido con el mouse
      setVelocity( dx*fuerza, dy*fuerza );
      estado = "movimiento";
      //tomo una marca en el tiempo
      marca = millis();
    }
  }
}
