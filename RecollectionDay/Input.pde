
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
    menuFade = true;
  }
  else{
    if(key == CODED){
      if(keyCode == LEFT){
        if(musicboxToggled){
          rIndX = max(0,rIndX-1);
        }
        else{
          keyLeft = true;
          playerAngle = PI;
        }
      }
      if(keyCode == RIGHT){
        if(musicboxToggled){
          rIndX = min(3,rIndX+1);
        }
        else{
          keyRight = true;
          playerAngle = 0;
        }
      }
      if(keyCode == UP){
        if(musicboxToggled){
          rIndY = max(0,rIndY-1);
        }
        else{
          keyUp = true;
        }
      }
      if(keyCode == DOWN){
        if(musicboxToggled){
          rIndY = min(2,rIndY+1);
        }
        else{
          keyDown = true;
        }
      }
    }
  }
  
  if(key == BACKSPACE){
    musicboxToggled = !musicboxToggled;
    if(musicboxToggled){
      map.music.pause();
      musicboxOpen.play();
      musicboxOpen.amp(-0.5);
    }
    else{
      map.music.play();
    }
  }
  
  // Test
  if(key == 't'){
    println("Set map: town");
    if(map == cave){
      map.music.stop();
      firstCue = true;
    }
    map = town;
  }
  if(key == 'h'){
    println("Set map: home");
    if(map == cave){
      map.music.stop();
      firstCue = true;
    }
    map = home;
  }
  if(key == 'c'){
    println("Set map: cave");
    map.music.stop();
    map = cave;
    firstCue = true;
  }
  if(key == '+'){
    rCount++;
    rX.append(-160 + 90*int((rCount-1)%4));
    rY.append(-70 + 80*int((rCount-1)/4));
    rAng.append(random(-PI/10,PI/10));
    println("Added new recollection. Total recollections: " + rCount);
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
