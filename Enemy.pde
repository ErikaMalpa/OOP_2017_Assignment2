/* The Zombie and 3 different collisions*/
class Enemy extends Skeleton
{
  float a, r;
  PVector pos, vel;
  
  Enemy(float x, float y,PVector vel, float rr)
  {
    this.pos = new PVector(x,y);
    this.r = rr;
    this.vel = vel.get();
  }
  
  /*Collision for bullets and enemy*/
  boolean Collision() {
    for (Bullet b : bullets) {
     if (pos.dist(b.location) < r/2) {
        Score = Score + 5;
        if(level > 90)
        {
          Money = Money + 10;
        }
        else
        {
          Money = Money + 5;
        }
        return true;
      }
    }
    return false;
  }
  /*Collision when zombies are on the right hand side or bottom*/
  boolean Invaded() {
    for (Enemy e : enemies) {
     if (pos.dist(e.pos) < 25/2) {
        return true;
      }
    }
    return false;
  }
  /*Collision of enemy & player*/
  boolean Hurt()
  {
    if(dist(pos.x,pos.y,player.x,player.y) <player.r)
    {
      return true;
    }
    return false;
  }
  
  void update()
  {
     pos.add(vel);
     /*Collision for bullets and enemy*/
    if (pos.x < 0 || pos.x > 900 - r || pos.y < 20 + r || pos.y > 850 - r || Collision()) {
      enemies.remove(this);//removes enemies on collision
      zombieSuccess.rewind();
      zombieSuccess.play();
   }
   /*Collision when zombies are on the right hand side or bottom*/
   if (pos.x > 900 - r || pos.y > 824 && Invaded()) {
     lives--;
     zombieSound.rewind();
     zombieSound.play();
   }
   /*Collision of enemy & player*/
   if (Hurt())
   {
     enemies.remove(this);//removes enemies on collision
     lives--;
     zombieSound.rewind();
     zombieSound.play();
     fill(255,0,0,80);
     rect(0,0,900,900);
   }
  }
  
  void display()
  {
    pushMatrix();
    fill(#F5E2B9);
    ellipse(pos.x, pos.y, r,r);
    stroke(0);
    line(pos.x - 15 ,pos.y - 10,pos.x,pos.y - 10);
    line(pos.x + 5,pos.y + 10,pos.x,pos.y + 25);
    popMatrix();
  }
}