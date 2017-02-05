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
Enemy[] enemy = new Enemy[10];
Gun gun;
//Bullet bullet;

/*Sounds and Images used*/
PImage bg;
PImage bg2;
AudioPlayer BackSound;
AudioPlayer gunshot;
Minim minim;

/*int float etc.*/
String chosenName;

/*Others*/

void setup()
{
  size(900,900);
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Enemy
  for( int i = 0; i < enemy.length; i++)
  {
  enemy[i] = new Enemy(random(50,800),random(50,800), 20);
  }
  
  //Gun
  gun = new Gun (width/2, height/2);
  
  //Bullet
  //bullet = new Bullet(width/3, height/3, 5);
  
  /*Others*/
  
  //Backgrounf Music
  minim = new Minim(this);
  BackSound = minim.loadFile("BackSound.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  BackSound.loop();
  
  //loading background Image
  bg = loadImage("BackGround.jpg");//http://img00.deviantart.net/5353/i/2013/276/f/6/ground_texture_06_by_bluecrystaleagle-d6p34ei.jpg
}

void draw()
{
  background(bg);
  
  pushMatrix();
  noStroke();
  fill(0);
  rect(1,1,900,50);
  rect(1,850,900,50);
  popMatrix();
  
  /* Classes */
  player.update();
  player.display();
  for( int i = 0; i < enemy.length; i++)
  {
  enemy[i].display();
  enemy[i].update();
  }
  gun.shoot();
  //bullet.display();
}
/*
void MenuDisplay()
{
  background (0);
  textAlign(CENTER);
  
  if(EnterName == false)
  {
    text("Enter your chosen EnterName : " + chosenName, width/2,height/-3);
    text("Enter if you dare!", width/2,height/2);
  }
  
  if(EnterName == true)
  {
    text("Welcome " + chosenName + "to Zombie Attack", width/2, height/2);
    text("Play", width/2, height/3);
    text("Highscore" ,width/2, height/4);
  }
  
}
}*/