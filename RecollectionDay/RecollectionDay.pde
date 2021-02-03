
////////////////////////////////////////////////////
// RECOLLECTION DAY
//   - Entry for: Berklee Video Game Music Jam 2020
//   - Theme: Deja vu
//   - Synopsis: A young girl with a music box picks
//               up audio cues to survive the
//               calamities that would inevitably
//               befall her quiet town.
////////////////////////////////////////////////////

Map map; // current map
Map town;
Map home;
Map cave;

void setup() {
  size(800, 600);
  colorMode(RGB, 1.0f);
  textureMode(NORMAL);
  textureWrap(CLAMP);
  loadPresets();
  map = town;
  noStroke();
}

void draw() {
  clear();
  resetMatrix();
  background(0,0,0);
  ortho(left, right, bottom, top);
  
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
