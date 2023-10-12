

void iniciar() {

  //inicializando el mundo
  mundo = new FWorld();
  //configuro los bordes
  // mundo.setEdges( 0, 0, width, height );
  //configurar la gravedad
  mundo.setGravity(0, 1000);

  flecha = new Flecha();
  //agrego la flecha al mundo
  flecha.attachImage(flechita);
  mundo.add( flecha );


  float posiX =200;
  agregarApple( posiX, mundo, "apple.png", "apple" );


  estado = "inicia";
}

void agregarApple( float posx, FWorld mundo, String nombreArchivo, String nombrePieza ) {

  //levanto la imagen de la pieza de ajedrez
  PImage imgApple = loadImage (nombreArchivo);
  //declaro e inicio un FBox con las dimensiones de la imagen
  FBox Apple = new FBox( imgApple.width*0.7, imgApple.height );
  Apple.setStatic (true);
  //establezco la posicion de las piezas
  Apple.setPosition(width-90, height-130);
  //le pongo la imagen del peon al FBox
  Apple.attachImage( imgApple );
  //le pongo un nombre a la pieza
  Apple.setName( nombrePieza );
  //lo agrego al mundo
  mundo.add( Apple);
}




boolean hayColisionEntre( FContact contact, String nombreUno, String nombreDos ) {
  //por defecto supongo que no se dio el contacto buscado
  boolean resultado = false;

  //le pido al contacto que me devuelva los cuerpos que participaron
  FBody uno = contact.getBody1();
  FBody dos = contact.getBody2();

  //pregunto por los nombres de los cuerpos  
  String etiquetaUno = uno.getName();
  String etiquetaDos = dos.getName();

  //verifico que ambos cuerpos tengan nombres
  if ( etiquetaUno != null && etiquetaDos != null ) {

    //si coinciden los nombres de los cuerpos con las etiquetas buscadas
    if ( 
      ( nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) ) ||
      ( nombreDos.equals( etiquetaUno ) && nombreUno.equals( etiquetaDos ) )
      ) {
      //entonces se dio el contacto buscado
      resultado = true;
    }
  }
  return resultado;
}
