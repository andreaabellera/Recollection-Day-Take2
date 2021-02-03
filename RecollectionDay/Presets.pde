
////////////////////////////////////////////////////
// PRESETS
//   - Includes setup variables, textures
////////////////////////////////////////////////////

// Screen
float left = -400;
float right = 400;
float bottom = 300;
float top = -300;

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




void loadPresets(){
  loadMapAssets();
  loadCharacterAssets();
  makeTown();
  makeHome();
  makeCave();
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

}

void makeTown(){
  town = new Map();
}

void makeHome(){
  home = new Map();
}

void makeCave(){
  cave = new Map();
}
