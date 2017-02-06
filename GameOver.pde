class GameOver
{
  void display()
  {
    background(0);
    pushMatrix();
    stroke(255);
    textSize(100);
    text("GAME OVER",450,300);
    textSize(50);
    text("The zombies are too strong, they invaded your area!", 450,350);
    text("Score: " + Score,450,400);
    gamefinish.play();
    popMatrix();
  }
}