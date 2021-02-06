
////////////////////////////////////////////////////
// PLAYER
//   - Controls Player drawing and movement
////////////////////////////////////////////////////

float playerX = -24.5;
float playerY = -77;
float lastX = playerX;
float lastY = playerY;
float pWidth = 6.5;
float pHeight = 17; 
float playerAngle = 0;
float pSpeed = 1.5;
Box pHitbox;

// Sprite frames for animation
PImage[] playerSide = new PImage[7];
PImage[] playerUp = new PImage[7];
PImage[] playerDown = new PImage[7];
PImage lastStatic;
int frameCtr = 0;

void movePlayer(){
  lastX = playerX;
  lastY = playerY;
  if(keyLeft){
    playerX = max(playerX-pSpeed, -map.mWidth+pWidth);
  }
  if(keyRight){
    playerX = min(playerX+pSpeed, map.mWidth-pWidth);
  }
  if(keyUp){
    playerY = max(playerY-pSpeed, -map.mHeight+pHeight);
  }
  if(keyDown){
    playerY = min(playerY+pSpeed, map.mHeight-pHeight);
  }
  
  updateHitbox();
  map.checkCollisions();
}

void drawPlayer(int frameCtr){
  pushMatrix();
  translate(playerX, playerY,0.1);
  rotateY(playerAngle);
  beginShape(QUADS);
  texture(lastStatic);
  if(keyDown || keyUp || keyLeft || keyRight){
    if(keyDown){
      texture(playerDown[frameCtr/9]);
    }
    else if (keyUp){
      texture(playerUp[frameCtr/9]);
    }
    else if (keyLeft){
      texture(playerSide[frameCtr/9]);
    }
    else{ //keyRight
      texture(playerSide[frameCtr/9]);
    }
  }
  vertex(-pWidth,-pHeight,  0,0);
  vertex(pWidth,-pHeight,  1,0);
  vertex(pWidth,pHeight,  1,1);
  vertex(-pWidth,pHeight,  0,1);
  endShape();
  popMatrix();
}

void updateHitbox(){
  pHitbox.l = playerX-pWidth;
  pHitbox.r = playerX+pWidth;
  pHitbox.b = playerY+pHeight;
  pHitbox.t = playerY;
}
