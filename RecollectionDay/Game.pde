
////////////////////////////////////////////////////
// GAME
//   - Handles game events and screen assets
////////////////////////////////////////////////////

Map map; // current map
Map town;
Map home;
Map cave;
boolean firstCue = true;

float mbX = 170; // coordinates of musicbox in screen
float mbY = -140;
float mbSize = 20;
float lerpAmt = 0.0; // musicbox animation upon toggle
FloatList rX = new FloatList();
FloatList rY = new FloatList();
FloatList rAng = new FloatList();

int rCount = 0;
int rIndX = 0;
int rIndY = 0;
float rHeight = 40;
float rWidth = 60;

void game(){
  map.draw();
  movePlayer();
    
  // TRACKER
  println(playerX + ", " + playerY);
    
  frameCtr++;
  drawPlayer(frameCtr);
  if(frameCtr == 60){
    frameCtr = 0;
  }
  map.drawMapSprites();
  
  // Musicbox
  if(musicboxToggled){
    lerpAmt = min(1, lerpAmt+0.1);
    textFont(recollections);
    textAlign(CENTER,CENTER);
    fill(0.6,0.6,0.55);
    text("RECOLLECTIONS", playerX, playerY-100);
    drawRecollections(rCount);
  }
  else{
    lerpAmt = max(0, lerpAmt-0.1);
  }
  mbX = lerp(170,-190,lerpAmt);
  drawMusicbox();
  
  // Handle soundtrack
  if(!map.music.isPlaying() && firstCue){ // this terrible code needs forgiveness
    map.music.play();
    firstCue = false;
  }
  
  if(!map.music.isPlaying() && !musicboxToggled && !firstCue){
    map.music.play();
    map.music.jump(map.loopEntry);
  }
  
}


void drawMusicbox(){
  noTint();
  beginShape(QUADS);
  texture(musicbox); 
  vertex(playerX+mbX, playerY+mbY,  0,0);
  vertex(playerX+mbX+mbSize, playerY+mbY,  1,0);
  vertex(playerX+mbX+mbSize, playerY+mbY+mbSize,  1,1);
  vertex(playerX+mbX, playerY+mbY+mbSize,  0,1);
  endShape();
  
  if(musicboxToggled){
    tint(0.5);
  }
}

void drawRecollections(int count){
  pushMatrix();
  for(int i = 0; i < count; i++){
    pushMatrix();
    translate(playerX+rX.get(i), playerY+rY.get(i), 0.2);
    rotate(rAng.get(i));
    
    if(i == rIndX + 4*rIndY){
      stroke(0.9,0.9,0.5);
    }
    beginShape(QUADS);
    texture(choicebox);
    //fill(0.6,0.6,0.55); 
    vertex(0, 0,  0,0);
    vertex(rWidth, 0,  1,0);
    vertex(rWidth, rHeight,  1,1);
    vertex(0, rHeight,  0,1);
    endShape();
    noStroke();
    popMatrix();
  }
  popMatrix();
}
