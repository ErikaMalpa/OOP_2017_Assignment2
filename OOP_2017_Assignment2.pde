/*
Author: Erika Secillano
Student Number: C15339871
Date:January - February 2017
Assignment 2
  
Overview of my assignemnt:

*/

/*Imports*/

/*Boolean used*/

/*Classes used*/
Player player;
Enemy enemy;

/*Sounds used*/

/*int float etc.*/

void setup()
{
  size(900,900);
  
  /*Classes*/
  
  //Player
  player = new Player(width/2, height/2, 50);
  
  //Enemy
  enemy = new Enemy(width/3, height/3, 20);
}

void draw()
{
  background(0);
  
  /* Classes */
  player.display();
  enemy.display();
}