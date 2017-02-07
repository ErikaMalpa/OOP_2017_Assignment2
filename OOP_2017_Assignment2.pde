/*
Author: Erika Secillano
Student Number: C15339871
Date:January - February 2017
Assignment 2
  
Overview of my assignemnt:

*/

/*Imports*/
import ddf.minim.*;

/*Boolean used*/
Boolean EnterName;
Boolean Begin;

/*Classes used*/
Player player;
Gun gun;
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
ArrayList <Enemy> enemies = new ArrayList <Enemy> ();
GameOver gameover;

/*Sounds and Images used*/
PImage bg;
PImage bullet;
PImage zombie;
PImage heart;
AudioPlayer BackSound;
AudioPlayer gunshot;
AudioPlayer zombieSound;
AudioPlayer zombieDeath;
AudioPlayer moneyN;//http://www.fromtexttospeech.com/
AudioPlayer lifedanger;
AudioPlayer gamefinish;
AudioPlayer noammo;
Minim minim;

/*Variables*/
String Oras;
String Oras2;
String UserName;
int speed;
int lastShot;
int Score;
int lives;
int Money;
int Amo;
int time;
int seconds;
int level;
int time2;
int seconds2;

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
  x = new PVector(width/2, height/2);
  y = new PVector();
  rand = new PVector(random(0,1), random(1,-1));
  lives = 10;
  Amo = 20;
  time = millis();
  seconds = 60000;
  level = 150;
  UserName = " ";
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Gun
  gun = new Gun (width/2, height/2);
  
  //GameOver
  gameover = new GameOver();
  
  /*Others*/
  
  //fonts used
  font = loadFont("BodoniMTPosterCompressed-48.vlw");
  textFont(font,80);
  
  //Backgrounf Music
  minim = new Minim(this);
  BackSound = minim.loadFile("BackSound.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  zombieSound = minim.loadFile("zsound.wav");
  zombieDeath = minim.loadFile("zombieDeath.mp3");
  moneyN = minim.loadFile("moneyneeded.mp3");
  lifedanger = minim.loadFile("lifeindanger.mp3");
  gamefinish = minim.loadFile("gameover.mp3");
  noammo = minim.loadFile("noammo.mp3");
  BackSound.loop();
  
  //loading background Image
  bg = loadImage("BackGround.jpg");//http://img00.deviantart.net/5353/i/2013/276/f/6/ground_texture_06_by_bluecrystaleagle-d6p34ei.jpg
  
  //zombie bg 2
  zombie = loadImage("zombie.jpg");
  
  //heart - http://pngimg.com/upload/heart_PNG706.png
  heart = loadImage("heart.png");
  
  //bullet
  bullet = loadImage("bullet.png");
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
  
  pushMatrix();//rect up and down
  noStroke();
  fill(255);
  rect(1,1,900,50);
  rect(1,850,900,50);
  popMatrix();
  
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
  
  println(level);
  
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
  }
  if(level == 60)
  {
    level = level - 20;
  }
  if(level == 40)
  {
    text("Level 4",750, 885);
  }
  if(level == 10)
  {
    background(255);
    noLoop();
    textSize(70);
    text("You've finished the game!",450, 300);
    text("Score: " + Score ,450, 400);
  }
  
  //first time
  if(millis() - time > seconds)
  {
    Oras = nf(int(millis()/1000));
    time = millis();
    level = level - 30;
  }
  
  //second time
  if(millis() - time2 > seconds2)
  {
    Oras2 = nf(int(millis()/1000));
    time2 = millis();
  }
  
  if( lives == 5)
  {
    lifedanger.rewind();
    lifedanger.play();
  }
  
  for (int i=bullets.size()-1; i>=0; i--) {
    Bullet b = bullets.get(i);
    b.update();
    b.display();
  }
  
  for (int i=enemies.size()-1; i>=0; i--) {
    Enemy e = enemies.get(i);
    e.update();
    e.display();
  }
  
  if (lives <= 0)
  {
    gameover.display();
  }
  
  addEnemy(level);
  
  if(Amo >= 1)
  {
    if (mousePressed && millis() - lastShot > 400) {
    addBullet();
    lastShot = millis();
    gunshot.rewind();
    gunshot.play();
    Amo--;
    }
  }
  else
  {
    print("noAmmo");
  }
  
  /* Classes */
  player.update();
  player.display();
  gun.shoot();
  }
}

void addEnemy(int x) {
  if (frameCount % x == 0) {
    enemies.add(new Enemy(random(10,450), random(50,200), rand, 25));
  }
}

void addBullet() {
  y.normalize();
  bullets.add(new Bullet(x,y));
}

void startMenu()
{
  background(zombie);
  textAlign(CENTER);
  
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
  
  if(EnterName == false)
  {
    stroke(255);
    noFill();
    text("Enter your EnterName if you dare:" + UserName, x,y);
  }
  
  if(EnterName == true)
  {
    stroke(255);
    noFill();
    textSize(50);
    text("Welcome to the Zombie Blast Game " + UserName, x,y);
    text("Alt to play",x, y + 50);
    //text("Ctrl for HighScore",x, y + 100);
    text("Q to quit",x, y + 100);
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
    } else if (keyCode == DELETE) 
    {
      UserName = "";
    } else if (keyCode != SHIFT && keyCode != BACKSPACE) 
    {
      UserName = UserName + key;
    }
    if (keyCode == ENTER)
    {
      EnterName = true;
      zombieSound.rewind();
      zombieSound.play();
      print("true");
    }
  }
  if (keyCode  == UP)
  {
    if (Money >= 200)
    {
      lives = lives + 5;
      Money = Money - 200;
    }
    else
    {
      moneyN.rewind();
      moneyN.play();
    }
  }
  if (keyCode  == DOWN)
  {
    if (Money >= 50)
    {
      Amo = Amo + 20;
      Money = Money - 50;
    }
    else
    {
      moneyN.rewind();
      moneyN.play();
    }
  }
  if (keyCode == ALT)
    {
      print("ALT");
      Begin = true;
      zombieSound.rewind();
      zombieSound.play();
    }
    if (keyCode == CONTROL)
    {
      print("CONTROL");
      zombieSound.rewind();
      zombieSound.play();
    }
    //to pause game
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
   if (keyCode == 'Q')
   {
     exit();
   }
}