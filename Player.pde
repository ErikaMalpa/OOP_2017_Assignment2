class Player extends Skeleton
{
  float x, y, r;
  boolean shoot;
  float bulletCounter;
  int i;
  PVector location;
  ArrayList<Bullet> bullets;
  
  Player(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    location = new PVector(width/2, height/2);
    bullets = new ArrayList<Bullet>();
  }
  
  void update()
  {
    if (mousePressed == true) 
    {
      if (shoot == true) 
      {
        bullets.add( new Bullet(5));
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
      if( bulletCounter == 5);
      {
        shoot = true;
      }
    }
    
    for (i = bullets.size()-1; i >= 0; i--) 
    {
    Bullet bullet = bullets.get(i);
    bullet.update();
    }
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