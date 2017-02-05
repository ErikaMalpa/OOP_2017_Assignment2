class Enemy extends Skeleton
{
  float x, y, r, a, speedX, speedY;
  
  Enemy(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    
    speedX = random(0.5);
    speedY = random(0.5);
  }
  
  void update()
  {
    x += speedX;
    y += speedY;
    
    a= r/2;
    
    if ( (x<a) || (x>width-a)){ 
      speedX = -speedX; 
    }  
    
    if( (y<a) || (y>height-a)) { 
      speedY = -speedY;  
    }
  }
  
  void display()
  {
    pushMatrix();
    fill(#F5E2B9);
    ellipse(x, y, r,r);
    popMatrix();
  }
}