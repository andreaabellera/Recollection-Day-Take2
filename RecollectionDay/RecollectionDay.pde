
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
boolean menuScreen = true;

void setup() {
  size(800, 600, P3D);
  colorMode(RGB, 1.0f);
  textureMode(NORMAL);
  textureWrap(CLAMP);
  loadPresets();
  loadMenuAssets();
  map = home;
  noStroke();
  noCursor();
}

void draw() {
  clear();
  if(menuScreen){
    menu();
  }
  else{
    ortho(left, right, bottom, top);
    camera(playerX,playerY,2, playerX,playerY,0, 0,1,0);
    game();
  } 
}
