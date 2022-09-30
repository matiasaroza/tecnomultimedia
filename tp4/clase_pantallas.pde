 class Pantallas{
  
  //VARIABLES---------------------------------------------------------
  int numero;
  PImage [] pantallas = new PImage [4];
 
  
   //CONSTRUCTOR------------------------------------------------------
  Pantallas(){
    for(int i = 0; i<pantallas.length; i++) {
      pantallas[i] = loadImage("pantalla"+i+".jpg");
    
    }
    
  }
  
  //METODOS--------------------------------------------------------- 
  void dibujarPantallas(int n){
  numero = n;
  image(pantallas[numero],0,0);
  }
  
  
}
