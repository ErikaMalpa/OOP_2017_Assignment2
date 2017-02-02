class Gun
{
  float x, y;
  Gun(float xx, float yy)
  {
    x = xx;
    y = yy;
  }
  
  void shoot()
  {
    stroke(255);
    line(x,y,mouseX,mouseY);
  }
  
}