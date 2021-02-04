
////////////////////////////////////////////////////
// PLAYER
//   - Controls Player drawing and movement
////////////////////////////////////////////////////

float playerX = width/2.0;
float playerY = height/2.0;

void movePlayer(){
  if(keyLeft){
    playerX -= 5;
  }
  if(keyRight){
    playerX += 5;
  }
  if(keyUp){
    playerY -= 5;
  }
  if(keyDown){
    playerY += 5;
  }

}
