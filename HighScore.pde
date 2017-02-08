/*Shows the high Score */
class HighScore
{
  void display()
  {
    background(zombie);
    String HScore[] = loadStrings("data/HighScore.txt");
    for (int i = 0; i < HScore.length; i++)
    {
      textSize(80);
      text("High Score", 450, 100);
      textSize(50);
      text(HScore[0],450, 200);
      text(HScore[1],450, 250);
      text(HScore[2],450, 300);
      text(HScore[3],450, 350);
      text(HScore[4],450, 400);
    }
    
    text("Press Alt to start game",450, 500);
    text("Press B to go back",450, 550);
    text("Press Q to quit",450,600);
  }
}