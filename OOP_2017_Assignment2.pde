/*
Author: Erika Secillano
Student Number: C15339871
Date:January - February 2017
Assignment 2
  
Overview of my assignemnt:

Rules for the game is very simple, you must eliminate the zombies before they invade your place, with your friends and family inside!

I highly recommend that you read the instructions!

You must aim for the head! aiming for the body or legs when they're near you is not a definite kill. You must aim for the head <From testing the game with the image, sometimes when the'yre beside you
and aim for their body you won't kill them. When you aim for the head it will definitely kill them>.

If the Zombie reaches the bottom on the right hand side of the screen life will be taken away from you.

If the Zombie touches you, your life will be taken away.

You can buy Lives and Ammo's if you have enough money.

To gain money you must kill the zombies, you will earn points and also money.

INSTRUCTIONS: 
1. Press the MOUSE button to shoot the zombies 
2. Use the mouse for the direction of the Bullets 
3. Press the UP button to buy additional lives 
4. Press the DOWN button to buy additional ammo 
5. Press Q to quit the game 
6. Press P to pause and resume the game 
7. Press Enter after you entered your name 
8. Press Alt to begin the game
9. Press R to restart game
10. Press B to go back to the Menu

*/

/*Imports*/
import ddf.minim.*;

/*Boolean used*/
Boolean EnterName;
Boolean Begin;//Start the game
Boolean hs;//highScore

/*Classes used*/
Player player;
Gun gun;
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
ArrayList <Enemy> enemies = new ArrayList <Enemy> ();
GameOver gameover;
HighScore highscore;

/*Sounds and Images used*/
PImage bg;//background image of the game
PImage bullet;//bullet
PImage zombie;//background image at the menu and enter name
PImage heart;//heart
PImage zombieBod;
AudioPlayer BackSound;//the background song
AudioPlayer gunshot;//gunshot sound
AudioPlayer zombieSound;//when player press the chosen keyCodes this will play and also when they succse going past the player
AudioPlayer zombieSuccess;//Plays when player is touched by zombies or dies
AudioPlayer moneyN;//"money needed"
AudioPlayer lifedanger;//"Life in critical danger... etc."
AudioPlayer gamefinish;//"Game Over"
AudioPlayer noammo;//"No ammo"
Minim minim;

/*Variables used*/
String Oras;
String Oras2;
String UserName;
int speed;//speed of text
int lastShot;
int Score;
int lives;
int Money;
int Amo;
int time;
int seconds;
int level;

/*Others*/
PFont font;
PVector x;
PVector y;
PVector rand;

void setup()
{
  size(900,900);
  
  EnterName = false;
  Begin = false;
  hs = false;
  x = new PVector(width/2, height/2);
  y = new PVector();
  rand = new PVector(random(0,1), random(1,-1));
  lives = 10;
  Amo = 20;
  time = millis();
  seconds = 60000;//seconds
  level = 150;
  UserName = " "; //must have this because it will display null on the screen instead of blank
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Gun
  gun = new Gun (width/2, height/2);
  
  //GameOver
  gameover = new GameOver();
  
  //HighScore
  highscore = new HighScore();
  
  /*Others*/
  
  //File i/o 
  if(lives < 1)
  {
    String Scoress = Score + " = " + UserName;
    String[] HScore = split(Scoress,' ');
    saveStrings("data/HighScore.txt",HScore);
  }
  
  /*fonts used*/
  font = loadFont("BodoniMTPosterCompressed-48.vlw");
  textFont(font,80);
  
  /*Music/sounds used*/
  minim = new Minim(this);
  BackSound = minim.loadFile("BackSound.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  zombieSound = minim.loadFile("zsound.wav");
  zombieSuccess = minim.loadFile("zombieDeath.mp3");
  moneyN = minim.loadFile("moneyneeded.mp3");
  lifedanger = minim.loadFile("lifeindanger.mp3");
  gamefinish = minim.loadFile("gameover.mp3");
  noammo = minim.loadFile("noammo.mp3");
  BackSound.loop();
  
  //background Image
  bg = loadImage("BackGround.jpg");//http://img00.deviantart.net/5353/i/2013/276/f/6/ground_texture_06_by_bluecrystaleagle-d6p34ei.jpg
  
  //zombie bg 2
  zombie = loadImage("zombie.jpg");
  
  //heart - http://pngimg.com/upload/heart_PNG706.png
  heart = loadImage("heart.png");
  
  //bullet
  bullet = loadImage("bullet.png");
  
  //zombie head
  zombieBod = loadImage("zombieW.png");//http://www.pngall.com/wp-content/uploads/2016/07/Zombie-Transparent.png
}

void draw()
{
  if(!Begin)
  {
    startMenu();
  }
  if(Begin)
  {
    background(bg);
    
    /*rect up and down*/
    pushMatrix();
    noStroke();
    fill(255);
    rect(1,1,900,50);
    rect(1,850,900,50);
    popMatrix();
    /*rect up and down END*/
    
    /*Text on display*/
    pushMatrix();
    textSize(40);
    fill(0);
    text("Player: " + UserName, 80,40);
    text("Score: " + Score, 240, 40);
    text("Lives: "+ lives, 440, 40);
    text("Ammo: " + Amo, 600, 40);
    text("Time: " + Oras2, 800, 40);
    text("Money: £" + Money, 80, 885);
    text("5         £200", 290, 885);
    image(heart, 260, 860);
    text("20       £50", 480, 885);
    image(bullet, 460, 855);
    popMatrix();
    /*Text on display end*/
    
    /* To print the level for me to know it's working*/
    println(level);
    
    /*Levels*/
    if(level == 150)
    {
      text("Level 1",750, 885);
    }
    if(level == 120)
    {
      text("Level 2",750, 885);
    }
    if(level == 90)
    {
      text("Level 3",750, 885);
      seconds = 80000;
    }
    if(level == 60)
    {
      level = level - 20;
      seconds = 90000;
    }
    if(level == 40)
    {
      text("Level 4",750, 885);
    }
    if(level == 10)
    {
      background(255);
      noLoop();//to make the gamestop drawing
      textSize(70);
      text("You've finished the game!",450, 300);
      text("Score: " + Score ,450, 400);
    }
    /*Levels End*/
    
    /*Timer used for the levels*/
    if(millis() - time > seconds)
    {
      Oras = nf(int(millis()/1000));
      time = millis();
      level = level - 30;
    }
    /*Timer used for the levels END*/
    
    /*Timer used to display*/
     Oras2 = nf(int(millis()/1000));
    /*Timer used to display END*/
    
    /* Classes */
    //Bullets
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet b = bullets.get(i);
      b.update();
      b.display();
    }
    
    //Enemies
    for (int i=enemies.size()-1; i>=0; i--) {
      Enemy e = enemies.get(i);
      e.update();
      e.display();
    }
    
    //if lives are 0 it will be gameOVer
    if (lives <= 0)
    {
      gameover.display();
      noLoop();
    }
    
    player.update();
    player.display();
    gun.display();
    /*Classes used END*/
    
    /*Others*/
    //if lives are 5, it will warn the player that it's lives are low and must buy more lives
    if( lives == 5)
    {
      lifedanger.rewind();
      lifedanger.play();
    }
    
    //The amount of spawn is controlled here
    addEnemy(level);
    
    //To make sure that bullets greater than 1, the player will be able to shoot, and it will play a gun shot sound
    if(Amo >= 1)
    {
      if (mousePressed && millis() - lastShot > 400) 
      {
      addBullet();
      lastShot = millis();
      gunshot.rewind();
      gunshot.play();
      Amo--;
      }
    }
    //else it will play that there will be no ammo
    else
    {
      print("noAmmo");
      noammo.rewind();
      noammo.play();
    }
   }
}

//To add enemy
void addEnemy(int x) {
  if (frameCount % x == 0) {
    enemies.add(new Enemy(random(10,450), random(50,200), rand, 50));
  }
}

//to add bulletes
void addBullet() {
  y.normalize();
  bullets.add(new Bullet(x,y));
}

void startMenu()
{
  background(zombie);
  textAlign(CENTER);
  
  /* Makes the text moved up and down for some spice */
  int x, y;
  
  x = width/2;
  y = height/2;
  y = y + speed;
  
  if( y > 445)
  {
    speed = -5;
  }
  if (y < 455)
  {
    speed = 5;
  }
  
  /* Makes the text moved up and down for some spice END */
  if(EnterName == false)
  {
    stroke(255);
    noFill();
    text("Enter your name if you dare:" + UserName, x,y);
  }
  
  if(EnterName == true)
  {
    stroke(255);
    noFill();
    textSize(50);
    text("Welcome to the Zombie Blast Game " + UserName, x,y - 100);
    text("Alt to play",x, y - 50);
    text("Q to quit",x, y);
    text("CTRL to view HighScore",x, y + 50);
    textSize(30);
    text("MOUSE to shoot",x,660);
    text("DOWN key to buy Ammo",x,700);
    text("UP key to buy Lives",x,740);
    text("P pause game",x,780);
    text("R restart game",x,820);
    if(hs)
    {
      highscore.display();
    }
  }
}
  
void keyPressed() 
{
  if (EnterName == false)
  {
    if (keyCode == BACKSPACE) 
    {
      if (UserName.length() > 0) 
      {
        UserName = UserName.substring(0, UserName.length()-1);
      }
    } 
    else if (keyCode == DELETE) 
    {
      UserName = "";
    } 
    else if (keyCode != SHIFT && keyCode != BACKSPACE) 
    {
      UserName = UserName + key;
    }
    //to enter the menu
    if (keyCode == ENTER)
    {
      EnterName = true;
      hs = false;
      zombieSound.rewind();
      zombieSound.play();
      print("true");
    }
  }
  //to buy lives
  if (keyCode  == UP)
  {
    if (Money >= 200)
    {
      lives = lives + 5;
      Money = Money - 200;
    }
    else//It will say that you need money
    {
      moneyN.rewind();
      moneyN.play();
    }
  }
  //to buy amo
  if (keyCode  == DOWN)
  {
    if (Money >= 50)
    {
      Amo = Amo + 20;
      Money = Money - 50;
    }
    else//It will say that you need money
    {
      moneyN.rewind();
      moneyN.play();
    }
  }
  //to play the game
  if (keyCode == ALT)
    {
      print("ALT");
      Begin = true;
      zombieSound.rewind();
      zombieSound.play();
    }
    //possible highscore
    if (keyCode == CONTROL)
    {
      print("CONTROL");
      zombieSound.rewind();
      zombieSound.play();
      highscore.display();
      hs = true;
    }
    //to pause game, stops the main from drawing by using noloop() and resumes by loop()
   if (keyCode == 'P')
   {
     if(looping)
     {
       noLoop();
       textSize(80);
       text("Paused",0,-100);
     }
     else
     {
       loop();
     }
   }
   //to quit the game
   if (keyCode == 'Q')
   {
     exit();
   }
   //to restart the game
   if(keyCode == 'R')
   {
     lives = 10;
     Amo = 20;
     Score = 0;
     Money = 0;
     bullets.clear();
     enemies.clear();
     seconds = 60000;
     level = 150;
   }
   //Code to go back
   if(keyCode == 'B')
   {
     loop();
     hs = false;
     Begin = false;
     lives = 10;
     Amo = 20;
     Score = 0;
     Money = 0;
     bullets.clear();
     enemies.clear();
     seconds = 60000;
     level = 150;
   }
}