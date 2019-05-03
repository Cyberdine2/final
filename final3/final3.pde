

Target[] Frosty = new Target[10];


//creates an array of spaceships called imageArray
Spaceship[] ship = new Spaceship[10];
//Then I named some new Targets (clickble pads) i named "Spaceships" and "ship". These are all used as objects.
///and Spaceships arn't clickable yet.
Spaceship BonusShip;
//PrintWriter output;
//BufferedReader reader;

PImage duck;
PImage duck2;
//Since this game is based onNintendo Duckhunt we loaded PImages caled "duck1" and "duck2"
//these PImages replaced the filed ellipses i started with with nintendoducks from google.
PImage grass;
public int points;
int level = 0;
float highBound;
float lowBound;
boolean levelBounce;
int ammo = 15;
//I needed a way to loose, so chriss recommended some ammo. Since this is involved with many of the games
//I luv and enjoy I thuroughly agreed it needed ammo. Eventually the ships I'd like 
//to get more ammo too.... But for now proof of concpt ships can move and animte
//but will have a ussfull funtion to the game as well
int screen = 0;
//This is where we set the screen as a number value for the switch method to function.
boolean beginGame = true;
float randomInt = 0;
int breaker = 1;
int[] PlayerScores = new int[10];
//str array to store lines
String[] lines;

void setup() {
  imageMode(CENTER);
  duck = loadImage("duck4flipped.png");
  duck2 = loadImage("duck4.png");
  grass = loadImage("grasscut.JPG");
   //here we loaded our images that will be used for later and the will be caed duck1, duck2, and grass.
  //reader = createReader("scores.txt");
 


  size(1920, 480);
  levelBounce = false;
  lowBound =1;
  highBound =5;
  for (int i = 0; i<10; i++) {
    //expect objects and they will be as an array
    // creates ducks
    Frosty[i] = new Target(lowBound, highBound);

    // populates the imageArray
    ship[i] = new Spaceship(lowBound, highBound);
  }
  //randomInt = random(-3,-7);
  BonusShip = new Spaceship(-3.6*lowBound, -3.6*highBound);



  lines = loadStrings("scores.txt");
  for (int i = 0; i < PlayerScores.length; i++) {
    //println(lines[i]); 
    PlayerScores[i]=int(lines[i]);
    println("" + i + "  " + PlayerScores[i]);
  }
  //previous version
  //lines = loadStrings("scores.txt");
  //for (int i = 0; i<lines.length; i++) {
  //  println(lines[i]);
}
//59-62 and 145



//for (int i = 0; i < PlayerScores.length; i++) {
//    PlayerScores[i]=0;
//   print (PlayerScores[i]);    
//else {
//     PlayerScores[counter]=int(line);
//      println("" + counter + "  " + line)        
//}  

//}


void draw() {
  switch(screen) {

  case 0:


    background(#44AFF8); 
    textSize(24); //sets test to24
    text("Score", width/8, height/12);    
    text(points, 1.5*width/8, height/12); 
    text(ammo, 7.5*width/8, height/12); 
    text("Ammo", 7*width/8, height/12);
    for (int i = 0; i<10; i++) {
      Frosty[i].display();  
      Frosty[i].move();     
      Frosty[i].bounce();      

      //ship[i].display();
      //ship[i].move();
      //ship[i].bounce();
    }

    if (ammo <= 2 || BonusShip.dead) {
      //if(Frosty[5].dead == true) {
      BonusShip.display(); //these are how my methods are called on for my objects
      BonusShip.move();      //and what they will do
      BonusShip.bounce();
    } 

    image(grass, 1000, 500, width+100, height/2);

    //this switches levels every 10 ducks killed *this was chriss's too 10 ducks way toprogress lol :)
    if (levelBounce == false && points != 0 && (points % 100) == 0) {
      lowBound += 1;
      highBound += 1;
      repopulate();
      level++;
      levelBounce= true;
       //This will print as a text value later, my levels are progressing a litte strangly when i try.
      //goes 0, 3, 6 for now not 1,2,3
      
    }

    if (beginGame == true) {
      text("GameBegin \n Rules: \n Hit the ducks with your mousepointer \n Each mouse click deducts 1 ammo. \n Each duck is worth 10 points. \n The game is over when you run out of ammo. \n Let the chaose begin!", width/2, height/2);
    }

    if (mousePressed == true) {
      beginGame = false;
    };



    break;


  case 1:
 //end game case for switch method, this is the gameover case and this is what changes the screens to game over..
    background(0);
    fill(#B70205);
    textSize(48);
    text("GameOver", width/2, height/2);

    //output = createWriter("scores.txt");
    //output.println(points);
    //output.flush();
    //output.close();
    //int counter = 0;
    //String line = "";
    //while (breaker != 2) {
    //  try {
    //    line = reader.readLine();
    //  }
    //  catch(IOException e) {
    //  }
    //  if (line == null) {
    //    println("This is working");
    //    breaker = 2;
    //    PlayerScores[counter] = points;
    //    break;
    //  } else {
    //    PlayerScores[counter]=int(line);
    //    println("" + counter + "  " + line);

    //    if (counter < 9) {
    //      counter++;
    //    }
    //  }

    //PlayerScores[0] = 0;
    //PlayerScores[1] = 0;
    //PlayerScores[2] = 0;
    //PlayerScores[3] = 0;
    //PlayerScores[4] = 0;
    //PlayerScores[5] = 0;
    //PlayerScores[6] = 0;
    //PlayerScores[7] = 0;


    //This is the section of the code where our scoreboard gets sorted
    int step = 0;
    int largest = 0;

    PlayerScores[9]=points; //this certainly doesn't do anything, maybe future expansion
     println(PlayerScores[0]); 
    for (int a = 0; a < 7; a++) {
      largest = step;
      
      //println("178");
      
    for (int b = step; b < 7; b++) { // this doesn't work at all ignore it
       if (PlayerScores[b] > PlayerScores[largest]) {
          largest = b;           
        }
      }
      int temp; 
      temp = PlayerScores[largest];
      PlayerScores[largest] = PlayerScores[a];
      PlayerScores[a] = temp;
      step++;
   
           for (int i =0; i<PlayerScores.length; i++) {
         println(PlayerScores[i]); //all of it useless
    
   }
   
   
  }

    
    textSize(16);
    text(PlayerScores[0], 300, 200); 
    text(PlayerScores[1], 300, 225); 
    text(PlayerScores[2], 300, 250);
    
// for (int i =0; i<8; i++) {
     // println(PlayerScores[i]);
   // }
    
    text(PlayerScores[3], 300, 275);
    text(PlayerScores[4], 300, 300);
    text(PlayerScores[5], 300, 325);
    text(PlayerScores[6], 300, 350);

 
 saveStrings("scores4.txt", str(PlayerScores));
 //saveStrings("scores3.txt", str(PlayerScores));
  //saveStrings("scores2.txt", str(PlayerScores));
   // saveStrings("scores.txt", str(PlayerScores)); 
    //output.close();

    break;
  }
}
//}

void mousePressed() {  
  for (int i = 0; i<10; i++) {
    Frosty[i].clicked();
     //This is how the objects that are technicly all the "targets" are clicked and hopefully "Spaceships"
  }

  BonusShip.ShipClicked(); 

  ammo -= 1;
  if (ammo == 0) {
    screen =1;
    //no matter what when the mouse is pressed and released this wil reduce the number value which is ammo set above
  }
}

void repopulate() {
  for (int i = 0; i<10; i++) {
    Frosty[i] = new Target(lowBound, highBound); //spwns new ducks on next level 

    // randomInt = random(-5,5);

    ship[i] = new Spaceship(lowBound, highBound);
  }
  level++;
  ammo = 15+(level*2); //gives 15 more ammo on next level 
}

public class Spaceship {
  //back to some objects again. here are what will be expecte for my Spaceship

  PImage[] imageArray;
 //This  shoud work like a flipbook of severa progressive renderings of a Spaceship
  //to animate "Nightmare Before Christmas" style renderings with Rhino3d and Vray
  //to make 3D modes into flat 2d images for 2d processing.
  float x;
  float y;
 //my x an y floats for a randomized position
  float Vspeed;
  float Hspeed;
//the horizonta speed and vertical speed floats
  int framecounter;
  int drawframe;
  boolean dead;
  //how we know a duck has ciesed to excist anymore, this should work the same for ships?
  //boolean mouseBeenpressed = false;

  float imageSizeX = 384;
  float imageSizeY = 63;

  boolean shipIsClicked = false;


  Spaceship(float lowBound, float highBound) {
    imageArray = new PImage[10]; 
    //this is where a ship gets spawned in a random position
    x = random(width);
    y = random(height);
    Hspeed = random(lowBound, highBound);  //this is how horizontal speed is random
    Hspeed = random(-highBound, highBound);  //this is how verticl speed is randomized
    Vspeed = random(lowBound, highBound); 
    drawframe = 0;
    framecounter = 0;
 //Iamges where in series every 6 degrees equaling 60 renders, those where divided again
//by 6 giving use 10 images to work with  modulo that clls the next in the array evey 10 frames
//drawn.

    imageArray[0] = loadImage("1.png");
    imageArray[1] = loadImage("2.png");
    imageArray[2] = loadImage("3.png");
    imageArray[3] = loadImage("4.png");
    imageArray[4] = loadImage("5.png");
    imageArray[5] = loadImage("6.png");
    imageArray[6] = loadImage("7.png");
    imageArray[7] = loadImage("8.png");
    imageArray[8] = loadImage("9.png");
    imageArray[9] = loadImage("10.png");
  }

  void display() {
  //This is how Chris showed me a modulo and explained with several equations to try 
    //then understand how to solve. which is how a number divides into another and the
    //result is the remainder of numbers that could not be divied anymore so we did this with
    //my framecount so we could maintain 60fps and my flipbook of renderings
    //could use %10 of the speed of tottal frames drawn
    
    
    framecounter++;
    framecounter = framecounter % 6;
    if (framecounter ==0) {
      drawframe++;
      drawframe = drawframe % 10;
    }
//this is my array of renderings of a spinning model UFO
    if (drawframe >= 0 && drawframe < 10) {
      image(imageArray[drawframe], x, y); //in this we replaced cases of images to be counter out by dawframe since this is a modulo
    }
  }


  void bounce() {

    if (!dead) {  //if my ducks are not dead this is how they wrap or bounce in the box by multiplying by a negitive
 //these re my vertical movements.
      if (y > height ||  y < 0) {
        Vspeed = -1*Vspeed; //same multiplication for horizontal movement 
      }
    }

    if (x > width || x < 0) {
      Hspeed = -1*Hspeed;
    }
  }

  void move() {
    x += Hspeed;
    y += Vspeed;
      //this is how my vertical movement and vertical movements are made random speeds
    //as Hspeed nd Vspeed are rndomized below
    
  }


  void ShipClicked() {
    if (mouseX < x + imageSizeX && mouseX > x - imageSizeY && mouseY < y + imageSizeX && mouseY > y - imageSizeY && shipIsClicked == false) {
      Vspeed = 10; 
   //this is where a duck dies. When my Terget objects are clicked
      //this is for when my pads or duckas are clcked within x and y position /2
      Hspeed = 0;
      dead = true;
      //this sets them to dead
      shipIsClicked = true;
      //if (dead == false){
      // points -=10;
      //}    
      // ammo += 4;
      //check and see if they're dead one at a time first and add 1 for each still living

      for (int i = 0; i<10; i++) {        
        if (Frosty[i].dead == false) {
          ammo += 1;
        }
      }
    }
    //levelBounce = false;
      // points -=10;
      //}    
      // ammo += 4;
      //check and see if they're dead one at a time first and add 1 for each still living
    
  }


  void clicked() {
    if (mouseX < x + width/2 && mouseX > x - height/2 && mouseY < y + width/2 && mouseY > y - height/2) {
      Vspeed = 10; 
      Hspeed = 0;
      //if (dead == false){
      // points -=10;
      //}
      dead = true;
      points += 10;//and this means they're worth 10 points
      //levelBounce = false;
    }
  }
}



public class Target {
   //here are all these targs I keep rambling about and are litterlly the ones called Targets
  //since these were the initial examples of wht  target willl be and how they work.
  //Following up i also found touchpad options in processing website, may also be implemented
  //in more ways than one... maybe combinations of touches to get ship or others random
  //objects? XD more cool stuff to do always = more fun, i'm not that creative but
  //we'll see where this goes i hope. For future expansions

  float x;
  float y;
  float Hspeed;
  float Vspeed;
  float Diameter;
  boolean dead;




  Target(float lowBound, float highBound) {
//this is how the clickble pads are spawned into a ranom height and width
    x = random(width);
    y = random(height);
 //These are targets they work how the ships will and partially do later, but all
    //clickable objects works sme except ships are animated more.
    Hspeed = random(lowBound, highBound);
    Vspeed = random(lowBound, highBound);
    Diameter = 50;
  }

  void display() {
    fill(#FC0000);
    image((Hspeed > 0 ? duck : duck2), x, y, Diameter, Diameter);
  }

  void bounce() {

    if (!dead) { //once again "if not dead" bounce off edge of screen
      if (y > height ||  y < 0) {
        Vspeed = -1*Vspeed;
      }
    }

    if (x > width || x < 0) { //bounce bounce bounce!!!
      Hspeed = -1*Hspeed;
    }
  }

  void move() {
    x += Hspeed;
    y += Vspeed;  //random x and y speeds plus movement. x and y are doing thing we want them used here
  }

  void clicked() {
    //clicking in the targes (which is actually mouse released)
    if (mouseX < x + Diameter/2 && mouseX > x - Diameter/2 && mouseY < y + Diameter/2 && mouseY > y - Diameter/2) {
      Vspeed = 10; 
      Hspeed = 0;
      dead = true;
      points += 10;
      //worth 10 points like most all good things worth hitting
      levelBounce = false;
    }
  }
}
