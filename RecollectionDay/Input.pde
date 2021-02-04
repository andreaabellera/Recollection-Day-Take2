
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
    println("you clicked " + key);
    menuTheme.stop();
    menuScreen = false;
  }
  else{
    if(key == CODED){
      if(keyCode == LEFT){
        keyLeft = true;
      }
      if(keyCode == RIGHT){
        keyRight = true;
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
    }
    if(keyCode == RIGHT){
      keyRight = false;
    }
    if(keyCode == UP){
      keyUp = false;
    }
    if(keyCode == DOWN){
      keyDown = false;
    }
  }
}
