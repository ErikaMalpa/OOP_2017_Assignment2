class Player extends Skeleton
{
  float x, y, r;
  boolean shoot;
  ArrayList<Bullet> bullets;
  float bulletCounter;
  
  
  Player(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    
    //Bullets
    bullets = new ArrayList<Bullet>();
  }
  
  void update()
  { 
  }
  
  void display()
  {
    pushMatrix();
    noStroke();
    fill(#796D3E);
    ellipse(x, y, r,r);
    popMatrix();
  }
}