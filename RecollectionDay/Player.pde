
////////////////////////////////////////////////////
// PLAYER
//   - Controls Player drawing and movement
////////////////////////////////////////////////////

float playerX = width/2.0;
float playerY = height/2.0;
float pWidth = 10;
float pHeight = 25; 
float playerAngle = 0;

// Sprite frames for animation
PImage[] playerSide = new PImage[7];
PImage[] playerUp = new PImage[7];
PImage[] playerDown = new PImage[7];
PImage lastStatic;
int frameCtr = 0;

void movePlayer(){
  if(keyLeft){
    playerX -= 2;
  }
  if(keyRight){
    playerX += 2;
  }
  if(keyUp){
    playerY -= 2;
  }
  if(keyDown){
    playerY += 2;
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
