class Bullet
{
  float x, y, r, rot, speed;
  PVector location; //location of the bullet
  int i;
  
  Bullet(PVector location, PVector vel)
  {
    this.r = 5;
    this.location = new PVector(width/2,height/2);
    this.x = mouseX;
    this.y = mouseY;
    this.speed = 5;
    this.rot = atan2 (y - location.y,x - location.x) / PI * 180;//to rotate
    
  }
  
  void update()
  {
    if (location.x < 0 || location.x > width || location.y < 0 || location.y > height) {
      bullets.remove(this);
    }
  }
  
  void display()
  {
    pushMatrix();
    //to move the bullet
    location.x = location.x + cos(rot/180*PI)*speed;
    location.y = location.y + sin(rot/180*PI)*speed;
    stroke(#003D64);
    noFill();
    ellipse(location.x, location.y, r,r);
    popMatrix();
  }
  
}