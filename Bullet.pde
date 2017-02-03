class Bullet
{
  float x, y, r, rot, speed;
  PVector location; //location of the bullet
  int i;
  
  Bullet(float rr)
  {
    r = rr;
    location = new PVector(width/2,height/2);
    x = mouseX;
    y = mouseY;
    this.speed = 5;
    rot = atan2 (y - location.y,x - location.x) / PI * 180;//to rotate
  }
  
  void update()
  {
    //to move the bullet
    location.x = location.x + cos(rot/180*PI)*speed;
    location.y = location.y + sin(rot/180*PI)*speed;
    stroke(#003D64);
    noFill();
    ellipse(location.x, location.y, r,r);
  }
  
}