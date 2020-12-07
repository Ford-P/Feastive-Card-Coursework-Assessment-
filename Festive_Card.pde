float bellMovement = -10;
boolean bellBoolean = false;
String newtimesroman = "";
int[] snowFlakeXArray = new int[20];
int[] snowFlakeYArray = new int[20];
int lightsNum = 0;
boolean lights = true;
PFont font;
boolean merryOver = false;
boolean backOver = false;
boolean frontPage = true;
boolean backPage = false;

//These two variables below detects if the user's cursor is in a certain area of the canvas and will return true if is
boolean overMerry(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
      return true;
  } else {
      return false;
  }
  }
  
  boolean overBack(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
      return true;
  } else {
      return false;
  }
  }
  
  import processing.sound.*;
  SoundFile song;

void setup() {
 size(800,600);
 
 //gives each snowflake a random X value
   for (int i = 0; i <= 19; i++) {
    snowFlakeXArray[i] = int(random(0,width));    
   }
   
   //gives each snowflake a random Y value
   for (int i = 0; i <= 19; i++) {
      snowFlakeYArray[i] = int(random(0,height));    
   }
 
 //imports font file and setting font to new times roman
  font = createFont("times-new-roman.ttf", 32);    
  textFont(font);    
  
  //imports the Frosty.mp3 file into a varible and plays the song in a loop
  song = new SoundFile(this, "Frosty.mp3");    
  song.loop();
  
}

void draw() {
  background(150,0,0);
  update(mouseX,mouseY);
  
//The content of the front page is in a if statement so when the user clicks on the merry christmas button it will return the frontPage varible false stopping the code within the if statement
  if (frontPage) {
    textSize(42);
    stroke(1);
    line((280+bellMovement),185,280,0);
    line((500+bellMovement),185,500,0);
    noStroke();
    fill(255,214,0);
    rect((255+bellMovement),180,50,50);
    fill(255,214,0);
    rect((475+bellMovement),130,50,50);
    fill(50,150,30);
    ellipse((280+bellMovement),300,200,200);
    fill(50,150,200);
    ellipse((500+bellMovement),250,200,200);
    
//Changes the button colour if the mouse cursor is hovering over it
     if (merryOver) {    
       fill(250,0,0);
     } else {
       fill(200,0,0);
     }

//Creating the button to go to the back page  
    rect(240,445,305,50);
    fill(255);
    text("Merry Christmas",250,480);
      
//This turns the lights around border on and off
    if (lightsNum <= 25) {
      lightsNum = lightsNum + 1;
      lights = true;
    } else {
        lightsNum = lightsNum + 1;
        lights = false;
    }
    
    if (lightsNum >= 50) {
      lightsNum = 0;
    }
  
    if (lights == true) {
      fill(150,100,50);
    } else {
        fill(220,180,0);
    }
    
//Sets each lights to their position
    for (int i = 0; i <= 490; i = i+70) {
      ellipse(50,i+50,50,50);
      ellipse(750,i+50,50,50);
    }
    for (int i = 0; i <= 700; i = i+70) {
      ellipse(i+50,50,50,50);
      ellipse(i+50,540,50,50);
    }
    
//Turns the lights on or off 
    if (lights == true) {
      fill(220,180,0);
    }
    else {
      fill(150,100,50);
    }
   
//Sets each lights to their position
    for (int i = 0; i <= 490; i = i+140) {
      ellipse(50,i+50,50,50);
      ellipse(750,i+50,50,50);
    }
    
    for (int i = 0; i <= 700; i = i+140) {
      ellipse(i+50,50,50,50);
    }
    
    for (int i = 0; i <= 560; i = i+140) {
      ellipse(i+120,540,50,50);
    }
    
    
//Snowflake movement
    fill(255,255,255,180);
    for (int i = 0; i<=19; i++) {
      rect(snowFlakeXArray[i],snowFlakeYArray[i],20,20);
    }
 
//Bell Movement 
    if (bellMovement >= 10.0) {
      bellBoolean = true;
    }  else if(bellMovement <= -10.0) {
      bellBoolean = false;
    }
    
    if (bellBoolean == false) {
      bellMovement = (bellMovement + 0.2);
     }  else if (bellBoolean == true) {
      bellMovement = (bellMovement - 0.2);
     }

//Resets the snowflake position
     for (int i = 0; i <= 19; i++) {
      if (snowFlakeYArray[i] >= 620){
        snowFlakeXArray[i] = int(random(0,width));
        snowFlakeYArray[i] = -20;
      }
    }
     for (int i = 0; i <= 19  ; i++) {
       snowFlakeYArray[i] = snowFlakeYArray[i] + 1;
    }
    
  } 
  
//when the user clicks the front page button it will set the boolean varible in the if statement to false stopping all th code in the back page 
  if (backPage) {
    
    //white background for the christmas text message
    stroke(1);
    fill(255);
    rect(20,20,760,560);

//Changes the button colour when the mouse is hovering over the front page button
    if (backOver) {
        fill(250,0,0);
      } else {
        fill(150,0,0);
      }
    
    //area for the back page button
    noStroke();
    rect(0,0,20,600);
    
    //Lines for the text to go on
    stroke(1);
    line(40,80,200,80); 
    for (int i=2; i<=6; i++){
       line(40,i*80,760,i*80); 
    }
    
    //Christmas message
    fill(150,0,0);
    textSize(39);
    text("To Mark",45, 80);
    text("Thank you for this semester i've really",40,160);
    text("enjoyed learning about coding in processing",40,240);
    text("and I hope this program gets me a good grade.",40,320);
    text("That being said i've really enjoyed coding this",40,400);
    text("and I hope you have a great Merry Christmas!",40,480);
    
    //arrow to indicate the user that it can go back to the front page
    fill(0);
    triangle(5,290,15,300,15,280);
  
  }
}

//This function dectects if the user's cursor is hovering over the buttons that switches between the pages
void update(int x, int y) {
  if (overMerry(240,445,300,50)) {
    merryOver = true;
    backOver = false;
  } else if (overBack(0,0,20,600)) {
  backOver = true;
  merryOver = false;
  } else {
    merryOver = backOver = false;
  }
}

//This switches between the front and back page if the button is clicked on by the user
void mousePressed() {
  if (merryOver) {
    backPage = true;
    frontPage = false;
  }
  if (backOver) {
  frontPage = true;
  backPage = false;
  }
}
