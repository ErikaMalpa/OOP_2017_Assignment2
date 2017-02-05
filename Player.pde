class Player extends Skeleton
{
  float x, y, r;
  boolean shoot;
  float bulletCounter;
  int i;
  ArrayList<Bullet> bullets;
  
  Enemy[] enemy = new Enemy[10];
  
  Player(float xx, float yy, float rr)
  {
    x = xx;
    y = yy;
    r = rr;
    
    bullets = new ArrayList<Bullet>();
    
    //Enemy
    for( int i = 0; i < enemy.length; i++)
    {
      enemy[i] = new Enemy(random(50,800),random(50,800), 20);
    }
  
  
  }
  
  void update()
  {
    for( int i = 0; i < enemy.length; i++)
    {
      enemy[i].display();
      enemy[i].update();
    }
    
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
    fill(#796D3E);
    ellipse(x, y, r,r);
    popMatrix();
  }
}