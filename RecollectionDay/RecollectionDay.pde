
////////////////////////////////////////////////////
// RECOLLECTION DAY
//   - Entry for: Berklee Video Game Music Jam 2020
//   - Theme: Deja vu
//   - Synopsis: A young girl with a music box picks
//               up audio cues to survive the
//               calamities that would inevitably
//               befall her quiet town.
////////////////////////////////////////////////////

import processing.sound.*;
SoundFile townTheme;
SoundFile caveTheme;

boolean menuScreen = true;
Map map; // current map
Map town;
Map home;
Map cave;

void setup() {
  size(800, 600, P3D);
  colorMode(RGB, 1.0f);
  textureMode(NORMAL);
  //textureWrap(CLAMP);
  loadPresets();
  loadMenuAssets();
  map = town;
  noStroke();
  noCursor();
}

void draw() {
  clear();
  if(menuScreen){
    menu();
  }
  //resetMatrix();
  //background(0,0,0);
  //ortho(left, right, bottom, top);
  
  //////////////////////
  // CAMERA
  //////////////////////
  
  //////////////////////
  // DRAW OBJECTS
  //////////////////////
  
  //frameCtr++;
  
  //drawMap();
  //movePlayer();
  //drawPlayer(frameCtr);
  
  //if(frameCtr == 60){
  //  frameCtr = 0;
  //}
}
