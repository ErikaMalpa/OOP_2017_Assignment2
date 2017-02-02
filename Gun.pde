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
    PVector mouse = new PVector(mouseX,mouseY);
    PVector center = new PVector(width/2,height/2);
    mouse.sub(center);
    mouse.normalize();
    mouse.mult(50);
    translate(x,y);
    stroke(255);
    line(0,0,mouse.x,mouse.y);
  }
  
}