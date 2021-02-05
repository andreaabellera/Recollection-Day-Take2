
////////////////////////////////////////////////////
// MENU
//   - Handles menu interface and animation
////////////////////////////////////////////////////

PFont title;
PFont subtitle;
PFont credits;
SoundFile menuTheme;
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

boolean menuFade = false;
float menuTint = 1.0;

void loadMenuAssets(){
  menuTheme = new SoundFile(this,"res/music/MX01_maintheme.wav");
  menuTheme.play();
  
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
  if(!menuTheme.isPlaying()){
    menuTheme.play();
    menuTheme.jump(27); // arbitrary jump, to be fixed
  }
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
  text("Press any key to start", width/2, 150);
  textFont(credits);
  fill(textBase-0.5,textBase-0.5,textBase-0.55);
  text("Berklee Video Game Music Jam 2020", width-150, height-30);
  
  if(menuFade){
    textBase -= 0.01;
    menuTint -= 0.01;
    tint(menuTint);
    menuTheme.amp(menuTint);
    if(menuTint <= 0){
      menuTheme.stop();
      menuScreen = false;
      noTint();
    }
  }
}

boolean gradualRise = false;
boolean panReverse = false;
boolean shardReverse = false;

void animate(){
  shardRise = max(225, shardRise-1);
  girlWidth = max(100, girlWidth*0.994);
  girlHeight = max(250, girlHeight*0.994);
  if(shardRise == 225 || shardReverse){
    shardReverse = true;
    if(!panReverse){
      panSides = min(0, panSides+1);
      if(panSides == 0){
        gradualRise = true;
        panReverse = true;
      }
    }
    else{
      panSides = max(-40, panSides-0.15);
      shardRise = min(250, shardRise+1.05);
      if(panSides == -40){
        panReverse = false;
        shardReverse = false;
      }
    }
    if(gradualRise && !menuFade){
      skyRise = max(-120, skyRise-0.1);
      textBase = max(0.2, textBase-0.01);
    }
  }
}
