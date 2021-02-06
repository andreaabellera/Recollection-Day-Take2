
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

// Dummy box texture
PImage hitboxTest;

void loadPresets(){
  hitboxTest = loadImage("res/hitboxtest.png");
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
  townTheme = new SoundFile(this, "res/music/MX02_town.wav");
  caveTheme = new SoundFile(this, "res/music/MX03_cavetheme.wav");
}

void loadInteractables(){
  //recollections = createFont("Colonna MT", 30);
  recollections = createFont("TektonPro-BoldCond", 30);
  musicboxOpen = new SoundFile(this, "res/music/MX04_musicbox.wav");
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
  spriteBoiler = loadImage("res/boiler.png");
  spriteTable = loadImage("res/table.png");
  spriteStove = loadImage("res/stove.png");
  
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
  pHitbox = new Box(hitboxTest,playerX-pWidth,playerX+pWidth,playerY+pHeight,playerY);
}

void makeTown(){
  town = new Map(mapTown, townTheme, 13, 200, 500); // Map image, map soundtrack, sountrack loop point, map image width, map image height
  
  town.addMapSprites(new Box(wallTownCave,-10,200,-445,-500));
      town.addHitbox(new Box(hitboxTest,-80,200,-445,-500));
          town.addDoor(new Door(hitboxTest,65,130,-440,-450,cave,0,0));
  town.addMapSprites(new Box(wallTownTop,-110,13,-403,-530));
      town.addHitbox(new Box(hitboxTest,-80,-75,-403,-413));
  
  town.addMapSprites(new Box(spriteMan,150,163,-350,-390));
      town.addHitbox(new Box(hitboxTest,150,163,-350,-360));
  
  town.addMapSprites(new Box(spriteHouseBack2,-26,60,-276,-442));
      town.addHitbox(new Box(hitboxTest,-6,40,-276,-342));
  town.addMapSprites(new Box(spriteHouseSide1,-80,31,-246,-376));
      town.addHitbox(new Box(hitboxTest,-50,11,-246,-296));
  town.addMapSprites(new Box(spriteHouseSide2,-80,11,-126,-255));
      town.addHitbox(new Box(hitboxTest,-70,1,-126,-205));
  town.addMapSprites(new Box(spriteHouseSide3,71,177,-60,-156));
      town.addHitbox(new Box(hitboxTest,91,167,-60,-106));
  
  town.addMapSprites(new Box(spriteWomanSide,25,43,-200,-240));
      town.addHitbox(new Box(hitboxTest,25,43,-200,-210));
  
  town.addMapSprites(new Box(spriteHouseBack1,-132,-16,34,-75));
      town.addHitbox(new Box(hitboxTest,-112,-34,34,-25));
  town.addMapSprites(new Box(spriteHouseFront1,-172,-87,155,35));
      town.addHitbox(new Box(hitboxTest,-160,-97,155,85));
          town.addDoor(new Door(hitboxTest,-140,-107,160,150,home,0,0));
  town.addMapSprites(new Box(spriteHouseFront2,-74,15,155,35));
      town.addHitbox(new Box(hitboxTest,-64,7,155,85));
  
  town.addMapSprites(new Box(spriteBoy,15,28,155,121));
      town.addHitbox(new Box(hitboxTest,15,28,155,145));
  town.addMapSprites(new Box(spriteFarmer,-108,-90,350,310));
      town.addHitbox(new Box(hitboxTest,-108,-90,350,340));
  
  town.addMapSprites(new Box(spriteWell,117,167,80,8));
      town.addHitbox(new Box(hitboxTest,130,160,80,48));
  town.addMapSprites(new Box(spriteCowpen,65,170,415,295));
      town.addHitbox(new Box(hitboxTest,70,165,415,375));
  town.addMapSprites(new Box(spriteSacks,-138,17,425,347));
      town.addHitbox(new Box(hitboxTest,-105,-73,420,387));
      town.addHitbox(new Box(hitboxTest,-128,-96,413,380));
      town.addHitbox(new Box(hitboxTest,-82,-50,400,367));
      town.addHitbox(new Box(hitboxTest,-17,13,417,384));
  
  town.addMapSprites(new Box(spriteWorkers,-68,-20,425,375));
      town.addHitbox(new Box(hitboxTest,-68,-20,425,415));
  
  //town.addMapSprites(new Box(spriteTrain,-24,130,472,350));
      //town.addHitbox(new Box(hitboxTest,-24,130,472,350));
  town.addMapSprites(new Box(wallTownLeft,-130,-257,30,-560));
  town.addMapSprites(new Box(wallTownRight,-130,-257,500,-30));
  town.addMapSprites(new Box(wallTownLeft,130,260,500,-30));
  town.addMapSprites(new Box(wallTownRight,130,260,30,-525));
}

void makeHome(){
  home = new Map(mapHome, townTheme, 13, 100, 220);
  home.addMapSprites(new Box(spriteBoiler,16,74,220,125));
      home.addHitbox(new Box(hitboxTest,16,74,220,198));
  home.addMapSprites(new Box(spriteTable,-54,1,0,-60));
      home.addHitbox(new Box(hitboxTest,-44,-4,0,-40));
  home.addMapSprites(new Box(spriteStove,58,100,65,-45));
      home.addHitbox(new Box(hitboxTest,63,100,65,-45));
  home.addMapSprites(new Box(wallHomeTop,-100,100,-220,-258));
      home.addHitbox(new Box(hitboxTest,-100,100,-220,-258));
  home.addMapSprites(new Box(wallHomeLeft,-110,-90,225,-258));
  home.addMapSprites(new Box(wallHomeRight,90,110,225,-258));
  home.addMapSprites(new Box(wallHomeBottom,-30,100,225,205));
          home.addDoor(new Door(hitboxTest,-90,-30,225,200,town,0,0));
  
  home.addMapSprites(new Box(spriteMomSide,43,58,45,5));
      home.addHitbox(new Box(hitboxTest,43,58,45,35));
}

void makeCave(){
  cave = new Map(mapCave, caveTheme, 0, 150, 280);
  cave.addMapSprites(new Box(wallCave,-150,150,280,-280));
  cave.addMapSprites(new Box(wallCaveDoor,-75,84,280,214));
          cave.addDoor(new Door(hitboxTest,-75,84,280,234,town,0,0));
}
