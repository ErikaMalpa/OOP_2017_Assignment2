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
PImage zombie;
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
String UserName;
int speed;
int lastShot;
int Score;
int lives;
int Money;
int Amo;

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
  Amo = 15;
  
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
  text("Score: " + Score, 250, 40);
  text("Lives: " + lives, 450, 40);
  text("Money: £" + Money, 80, 885);
  text("10 Lives for £200", 650, 40);
  text("Ammo: " + Amo, 250, 885);
  text("20 Ammo for £50", 450, 885);
  popMatrix();
  
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
  
  addEnemy(50);
  
  if(Amo >= 1)
  {
    if (mousePressed && millis() - lastShot > 500) {
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
    text("Enter your EnterName if you dare: " + UserName, x,y);
  }
  
  if(EnterName == true)
  {
    stroke(255);
    noFill();
    textSize(50);
    text("Welcome to the Zombie Blast Game " + UserName, x,y);
    text("Alt to play",x, y + 50);
    text("Ctrl for HighScore",x, y + 100);
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
      lives = lives + 10;
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
}