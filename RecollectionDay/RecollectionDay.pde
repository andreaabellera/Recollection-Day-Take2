
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
Map map; // current map
Map town;
Map home;
Map cave;

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
    camera(playerX,playerY,1, playerX,playerY,0, 0,1,0);
    map.draw();
    movePlayer();
    
    // TRACKER
    //println(playerX + ", " + playerY);
    
    frameCtr++;
    drawPlayer(frameCtr);
    if(frameCtr == 60){
      frameCtr = 0;
    }
    map.drawSprites();
    drawMusicbox();
  }
  
}
