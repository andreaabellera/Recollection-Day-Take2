
////////////////////////////////////////////////////
// MUSICBOX
//   - Musicbox interface and cues
////////////////////////////////////////////////////

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

void drawMusicbox(){
  noTint();
  beginShape(QUADS);
  texture(musicbox); 
  vertex(playerX+mbX, playerY+mbY,1,  0,0);
  vertex(playerX+mbX+mbSize, playerY+mbY,1,  1,0);
  vertex(playerX+mbX+mbSize, playerY+mbY+mbSize,1,  1,1);
  vertex(playerX+mbX, playerY+mbY+mbSize,1,  0,1);
  endShape();
  
  //if(musicboxToggled){
  //  tint(0.5);
  //}
}

void drawRecollections(int count){
  pushMatrix();
  for(int i = 0; i < count; i++){
    pushMatrix();
    translate(playerX+rX.get(i), playerY+rY.get(i), 1);
    rotate(rAng.get(i));
    
    if(i == rIndX + 4*rIndY){
      stroke(0.9,0.9,0.5);
    }
    beginShape(QUADS);
    texture(choicebox); 
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
