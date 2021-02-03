
////////////////////////////////////////////////////
// MENU
//   - Handles menu interface and animation
////////////////////////////////////////////////////

PFont title;
PFont subtitle;
PFont credits;
PImage menuImage;
PImage menuShards;
PImage menuGrass;
PImage menuGirl;
PImage menuSky;
PImage menuCaveLeft;
PImage menuCaveRight;

float skyRise = 0;
float shardRise = 250;
float textBase = 0.7;
float panSides = -80;
float girlWidth = 150;
float girlHeight = 380;

void loadMenuAssets(){
  title = createFont("Garamond Bold", 60);
  subtitle = createFont("Garamond", 24);
  credits = createFont("Yu Gothic Bold", 15);
  menuImage = loadImage("res/menustatic.jpg");
  menuShards = loadImage("res/menushards.png");
  menuSky = loadImage("res/menusky.jpg");
  menuGrass = loadImage("res/menugrass.png");
  menuGirl = loadImage("res/menugirl.png");
  menuCaveLeft = loadImage("res/menucaveleft.png");
  menuCaveRight = loadImage("res/menucaveright.png");
}

void menu(){
  animate();
  image(menuSky, 0, skyRise, width, height);
  image(menuShards, 0, shardRise, width, 130);
  image(menuGrass, 0, 0, width, height);
  image(menuGirl, 300, 300, girlWidth, girlHeight);
  image(menuCaveLeft, panSides, 0);
  image(menuCaveRight, width-190-panSides, 0);
  textFont(title);
  textAlign(CENTER,CENTER);
  fill(textBase,textBase,textBase-0.05);
  text("Recollection Day", width/2, 100);
  textFont(subtitle);
  text("Press any key to START", width/2, 150);
  textFont(credits);
  fill(0.2,0.2,0.15);
  text("Andrea Abellera . 2021", width-100, height-30);
}

void animate(){
  shardRise = max(225, shardRise-1);
  if(shardRise == 225){
    girlWidth = max(100, girlWidth*0.994);
    girlHeight = max(250, girlHeight*0.994);
    panSides = min(0, panSides+1);
    if(panSides == 0){
      skyRise = max(-120, skyRise-0.1);
      textBase = max(0.2, textBase-0.01);
    }
  }
}
