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
boolean shoot;

/*Classes used*/
Player player;
Gun gun;
ArrayList<Bullet> bullets;
Enemy[] enemy = new Enemy[10];

/*Sounds and Images used*/
PImage bg;
PImage zombie;
AudioPlayer BackSound;
AudioPlayer gunshot;
AudioPlayer zombieSound;
Minim minim;

/*Variables*/
String UserName;
float bulletCounter;
int speed;

/*Others*/
PFont font;

void setup()
{
  size(900,900);
  
  EnterName = false;
  Begin = false;
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Gun
  gun = new Gun (width/2, height/2);
  
  //Bullets
  bullets = new ArrayList<Bullet>();
  
  //Enemy
    for( int i = 0; i < enemy.length; i++)
    {
      enemy[i] = new Enemy(random(50,800),random(50,800), 20);
    }
  
  /*Others*/
  
  //fonts used
  font = loadFont("BodoniMTPosterCompressed-48.vlw");
  textFont(font,80);
  
  //Backgrounf Music
  minim = new Minim(this);
  BackSound = minim.loadFile("BackSound.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  zombieSound = minim.loadFile("zsound.wav");
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
  
  pushMatrix();
  noStroke();
  fill(0);
  rect(1,1,900,50);
  rect(1,850,900,50);
  popMatrix();
  
  //Enemy start//
  for( int i = 0; i < enemy.length; i++)
    {
      enemy[i].display();
      enemy[i].update();
    }
    //Enemy end//

    //Bullets Start//
    
    if (mousePressed == true) 
    {
      if (shoot == true) 
      {
        bullets.add( new Bullet());
        shoot = false;
        bulletCounter = 0;
        println("Shoot");
        gunshot.rewind();
        gunshot.play();
      }
    }
    
    if (shoot == false) 
    {
      bulletCounter ++;
      if( bulletCounter == 10)
      {
        shoot = true;
      }
    }
    
    for (int i = bullets.size()-1; i >= 0; i--) 
    {
      Bullet bullet = bullets.get(i);
      bullet.update();
    }
  
  //Bullets End//
  
  /* Classes */
  player.update();
  player.display();
  gun.shoot();
  }
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
    //add sound when clicked
  }
  
  if(EnterName == true)
  {
    stroke(255);
    noFill();
    textSize(50);
    text("Welcome to the Zombie Blast Game " + UserName, x,y);
    text("Alt to play",x, y + 50);
    text("Ctrl for HighScore",x, y + 100);
    //add sound when clicked
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