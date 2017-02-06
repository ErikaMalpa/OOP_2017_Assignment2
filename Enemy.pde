class Enemy extends Skeleton
{
  float r, a;
  PVector pos, vel;
  float d;
  
  Enemy(float x, float y,PVector vel, float dd)
  {
    pos = new PVector(x,y);
    this.d = dd;
    this.vel = vel.get();
  }
  
  boolean Collision() {
    for (Bullet b : bullets) {
     if (pos.dist(b.location) < d/2) {
       Score = Score + 5;
       
        return true;
      }
    }
    return false;
  }
  
  void update()
  {
     pos.add(vel);
    if (pos.x < 0 || pos.x > 900 - d || pos.y < 50 + d || pos.y > 850 - d || Collision()) {
      enemies.remove(this);
   }
  }
  
  void display()
  {
    pushMatrix();
    fill(#F5E2B9);
    ellipse(pos.x, pos.y, d,d);
    stroke(0);
    line(pos.x - 15 ,pos.y - 10,pos.x,pos.y - 10);
    line(pos.x + 5,pos.y + 10,pos.x,pos.y + 25);
    popMatrix();
  }
};