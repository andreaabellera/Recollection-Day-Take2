
////////////////////////////////////////////////////
// GAME
//   - Handles game events and screen assets
////////////////////////////////////////////////////

void drawMusicbox(){
  beginShape(QUADS);
  texture(musicbox); 
  vertex(playerX+170,playerY-140);
  vertex(playerX+190,playerY-140);
  vertex(playerX+190,playerY-120);
  vertex(playerX+170,playerY-120);
  endShape();
}
