class Gun
{
  float x, y, x2, y2;
  Gun(float xx, float yy, float xx2, float yy2)
  {
    x = xx;
    y = yy;
    x2 = xx2;
    y2 = yy2;
  }
  
  void shoot()
  {
    stroke(255);
    line(x,y,x2,y2);
  }
  
}