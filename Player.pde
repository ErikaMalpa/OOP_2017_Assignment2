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
    if (mousePressed == true) 
    {
      if (shoot == true) 
      {
        bullets.add( new Bullet());
        shoot = false;
        bulletCounter = 0;
        println("Shoot");
        gunshot.rewind();
        gunshot.play();
      }
    }
    
    if (shoot == false) 
    {
      bulletCounter ++;
      if( bulletCounter == 10)
      {
        shoot = true;
      }
    }
    
    for (int i = bullets.size()-1; i >= 0; i--) 
    {
      Bullet bullet = bullets.get(i);
      bullet.update();
    }
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