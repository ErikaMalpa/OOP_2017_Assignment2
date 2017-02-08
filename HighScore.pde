class HighScore
{
  void display()
  {
    background(0);
    String HScore[] = loadStrings("data/HighScore.txt");
    for (int i = 0; i < HScore.length; i++)
    {
      textSize(70);
      text("High Score", 450, 200);
      textSize(50);
      text(HScore[0],450, 300);
      text(HScore[1],450, 350);
      text(HScore[2],450, 400);
      text(HScore[3],450, 450);
      text(HScore[4],450, 500);
    }
  }
}