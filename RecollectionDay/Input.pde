
////////////////////////////////////////////////////
// INPUT
//   - Define keyPressed controls
////////////////////////////////////////////////////

boolean musicboxToggled = false;
boolean keyLeft = false;
boolean keyRight = false;
boolean keyUp = false;
boolean keyDown = false;

void keyPressed(){
  if(menuScreen){
    menuTheme.stop();
    menuScreen = false;
  }
  else{
    if(key == CODED){
      if(keyCode == LEFT){
        keyLeft = true;
        playerAngle = PI;
      }
      if(keyCode == RIGHT){
        keyRight = true;
        playerAngle = 0;
      }
      if(keyCode == UP){
        keyUp = true;
      }
      if(keyCode == DOWN){
        keyDown = true;
      }
      if(keyCode == BACKSPACE){
        musicboxToggled = true;
      }
    }
  }
  
  
  // Test
  if(key == 't'){
    println("Set map: town");
    map.stopTheme();
    map = town;
    map.playTheme();
  }
  if(key == 'h'){
    println("Set map: home");
    map.stopTheme();
    map = home;
    map.playTheme();
  }
  if(key == 'c'){
    println("Set map: cave");
    map.stopTheme();
    map = cave;
    map.playTheme();
  }
  
}


void keyReleased(){
  if(key == CODED){
    if(keyCode == LEFT){
      keyLeft = false;
      lastStatic = playerSide[frameCtr/9];
    }
    if(keyCode == RIGHT){
      keyRight = false;
      lastStatic = playerSide[frameCtr/9];
    }
    if(keyCode == UP){
      keyUp = false;
      lastStatic = playerUp[frameCtr/9];
    }
    if(keyCode == DOWN){
      keyDown = false;
      lastStatic = playerDown[frameCtr/9];
    }
  }
}
