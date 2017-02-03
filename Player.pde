class Player extends Skeleton
{
  float x, y, r;
  
  Player(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
  }
  
  void update()
  {
    
  }
  
  void display()
  {
    pushMatrix();
    noStroke();
    fill(#FCFF64);
    ellipse(x, y, r,r);
    popMatrix();
  }
}