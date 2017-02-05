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

/*Sounds and Images used*/
PImage bg;
PImage zombie;
AudioPlayer BackSound;
AudioPlayer gunshot;
Minim minim;

/*int float etc.*/
String UserName;

/*Others*/
PFont font;

void setup()
{
  size(900,900);
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Gun
  gun = new Gun (width/2, height/2);
  
  /*Others*/
  
  //fonts used
  font = loadFont("BlackadderITC-Regular-48.vlw");
  textFont(font,50);
  
  //Backgrounf Music
  minim = new Minim(this);
  BackSound = minim.loadFile("BackSound.mp3");
  gunshot = minim.loadFile("gunshot.wav");
  BackSound.loop();
  
  //loading background Image
  bg = loadImage("BackGround.jpg");//http://img00.deviantart.net/5353/i/2013/276/f/6/ground_texture_06_by_bluecrystaleagle-d6p34ei.jpg
  
  //zombie bg 2
  zombie = loadImage("zombie.jpg");
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
  gun.shoot();
}

void startMenu()
{
  background(zombie);
  textAlign(CENTER);
  
  if(EnterName == false)
  {
    stroke(255);
    noFill();
    text("Enter your EnterName if you dare: " + UserName, width/2, height/2);
    //add sound when clicked
  }
  
  if(EnterName == true)
  {
    stroke(255);
    noFill();
    textSize(50);
    text("Welcome to the Zombie Blast Game " + UserName + "!", width/2, height/2 - 100);
    text("Press alt to play",width/2, height/2 + 50);
    //add sound when clicked
  }
}