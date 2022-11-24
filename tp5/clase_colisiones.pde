boolean colisionCoorSupRectangulares( 
  float x1_, float y1_, float ancho1_, float alto1_, 
  float x2_, float y2_, float ancho2_, float alto2_ ) {
  if (
    x2_+ancho2_>x1_-ancho1_ && x2_-ancho2_<x1_+ancho1_ &&
    y2_+alto2_>y1_-alto2_ && y2_-alto2_<y1_+alto1_)
  {
    return true;
  }
  return false;
}
