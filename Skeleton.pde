abstract class Skeleton
{
  boolean isAlive;
  float x, y;
  
  Skeleton()
  {
    isAlive = true;
  }
  
  abstract void update();
  abstract void display();