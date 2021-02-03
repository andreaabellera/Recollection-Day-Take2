
////////////////////////////////////////////////////
// INPUT
//   - Define keyPressed controls
////////////////////////////////////////////////////

boolean musicboxToggled = false;

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
    
    }
    if(keyCode == RIGHT){
    
    }
    if(keyCode == UP){
    
    }
    if(keyCode == DOWN){
    
    }
    if(keyCode == BACKSPACE){
      musicboxToggled = true;
    }
  }
  
  
  // Test
  if(key == 't'){
    map = town;
  }
  if(key == 'h'){
    map = home;
  }
  if(key == 'c'){
    map = cave;
  }
  
}
