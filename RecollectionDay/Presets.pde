
////////////////////////////////////////////////////
// PRESETS
//   - Includes setup variables, textures
////////////////////////////////////////////////////

// Screen
float left = -200;
float right = 200;
float bottom = -150;
float top = 150;

// Music
SoundFile townTheme;
SoundFile caveTheme;

// Interaction assets
PFont recollections;
SoundFile musicboxOpen;
PImage musicbox;
PImage textbox;
PImage choicebox;

// Maps
PImage mapTown;
PImage wallTownCave;
PImage wallTownTop;
PImage wallTownLeft;
PImage wallTownRight;
PImage spriteHouseBack1;
PImage spriteHouseBack2;
PImage spriteHouseFront1;
PImage spriteHouseFront2;
PImage spriteHouseSide1;
PImage spriteHouseSide2;
PImage spriteHouseSide3;
PImage spriteHouseRuin1;
PImage spriteHouseRuin2;
PImage spriteHouseRuin3;
PImage spriteCowpen;
PImage spriteWarehouse;
PImage spriteWell;
PImage spriteSacks;
PImage spriteTrain;

PImage mapHome;
PImage wallHomeTop;
PImage wallHomeLeft;
PImage wallHomeRight;
PImage wallHomeBottom;
PImage spriteBoiler;
PImage spriteTable;
PImage spriteStove;

PImage mapCave;
PImage wallCave;
PImage wallCaveDoor;

// Characters
PImage spriteWoman;
PImage spriteWomanSide;
PImage spriteMom;
PImage spriteMomSide;
PImage spriteBoy;
PImage spriteMan;
PImage spriteFarmer;
PImage spriteWorkers;

void loadPresets(){
  loadMusic();
  loadInteractables();
  loadMapAssets();
  loadCharacterAssets();
  makeTown();
  makeHome();
  makeCave();
  
  
  // PFONT ITERATOR
  //String[] fonts = PFont.list(); 
  //for(int i = 0; i < fonts.length; i++){
  //  println(fonts[i]);
  //}
}

void loadMusic(){
  townTheme = new SoundFile(this, "res/music/MX02_town_v01.wav");
  caveTheme = new SoundFile(this, "res/music/MX03_cavetheme_v02.wav");
}

void loadInteractables(){
  //recollections = createFont("Colonna MT", 30);
  recollections = createFont("TektonPro-BoldCond", 30);
  musicboxOpen = new SoundFile(this, "res/music/MX04_musicbox_v01.wav");
  musicbox = loadImage("res/musicbox.png");
  textbox = loadImage("res/textbox.png");
  choicebox = loadImage("res/choicebox.png");
}

void loadMapAssets(){
  mapTown = loadImage("res/townfloor.jpg");
  wallTownCave = loadImage("res/cave.png");
  wallTownTop = loadImage("res/trees-trio.png");
  wallTownLeft = loadImage("res/trees-left.png");
  wallTownRight = loadImage("res/trees-right.png");
  spriteHouseBack1 = loadImage("res/back1.png");
  spriteHouseBack2 = loadImage("res/back2.png");
  spriteHouseFront1 = loadImage("res/front1.png");
  spriteHouseFront2 = loadImage("res/front2.png");
  spriteHouseSide1 = loadImage("res/side1.png");
  spriteHouseSide2 = loadImage("res/side2.png");
  spriteHouseSide3 = loadImage("res/side3.png");
  spriteHouseRuin1 = loadImage("res/ruin1.png");
  spriteHouseRuin2 = loadImage("res/ruin2.png");
  spriteHouseRuin3 = loadImage("res/ruin3.png");
  spriteCowpen  = loadImage("res/cowpen.png");
  spriteWarehouse = loadImage("res/warehouse.png");
  spriteWell = loadImage("res/well.png");
  spriteSacks = loadImage("res/townsacks.png");
  spriteTrain = loadImage("res/train.png");
  
  mapHome = loadImage("res/homefloor.jpg");
  wallHomeTop = loadImage("res/wall.png");
  wallHomeLeft = loadImage("res/wallthin2.png");
  wallHomeRight = loadImage("res/wallthin3.png");
  wallHomeBottom = loadImage("res/wallthin1.png");
  
  mapCave = loadImage("res/cavefloor.jpg");
  wallCave = loadImage("res/cavewall.png");
  wallCaveDoor = loadImage("res/cavedoor.png");
}

void loadCharacterAssets(){
  spriteWoman = loadImage("res/woman.png");
  spriteWomanSide = loadImage("res/womanside.png");
  spriteMom = loadImage("res/mom.png");
  spriteMomSide = loadImage("res/momside.png");
  spriteBoy = loadImage("res/boy.png");
  spriteMan = loadImage("res/man.png");
  spriteFarmer = loadImage("res/farmer.png");
  spriteWorkers = loadImage("res/workers.png");
  
  for(int i = 0; i < 7; i++){
    playerSide[i] = loadImage("res/playersprite/playerside" + (i+1) + ".png");
    playerUp[i] = loadImage("res/playersprite/playerup" + (i+1) + ".png");
    playerDown[i] = loadImage("res/playersprite/playerdown" + (i+1) + ".png");
  }
  lastStatic = playerDown[0];
}

void makeTown(){
  town = new Map(mapTown, townTheme, 14, 200, 500); // Map image, map soundtrack, sountrack loop point, map image width, map image height
}

void makeHome(){
  home = new Map(mapHome, townTheme, 14, 100, 220);
}

void makeCave(){
  cave = new Map(mapCave, caveTheme, 0, 150, 280);
}
