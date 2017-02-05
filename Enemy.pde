class Enemy extends Skeleton
{
  float x, y, r, speedX, speedY;
  
  Enemy(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    
    speedX = random(-5,5);
    speedY = random(-5,5);
  }
  
  void update()
  {
    x += speedX;
    y += speedY;
  }
  
  void display()
  {
    pushMatrix();
    fill(#F5E2B9);
    ellipse(x, y, r,r);
    popMatrix();
  }
}