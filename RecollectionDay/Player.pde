
////////////////////////////////////////////////////
// PLAYER
//   - Controls Player drawing and movement
////////////////////////////////////////////////////

float playerX = -24.5;
float playerY = -77;
float pWidth = 6.5;
float pHeight = 17; 
float playerAngle = 0;

// Sprite frames for animation
PImage[] playerSide = new PImage[7];
PImage[] playerUp = new PImage[7];
PImage[] playerDown = new PImage[7];
PImage lastStatic;
int frameCtr = 0;

void movePlayer(){
  if(keyLeft){
    playerX -= 1.5;
  }
  if(keyRight){
    playerX += 1.5;
  }
  if(keyUp){
    playerY -= 1.5;
  }
  if(keyDown){
    playerY += 1.5;
  }
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
