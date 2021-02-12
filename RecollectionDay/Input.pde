
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
        else if(!playerPause){
          keyLeft = true;
          playerAngle = PI;
        }
      }
      if(keyCode == RIGHT){
        if(musicboxToggled){
          rIndX = min(3,rIndX+1);
        }
        else if(!playerPause){
          keyRight = true;
          playerAngle = 0;
        }
      }
      if(keyCode == UP){
        if(musicboxToggled){
          rIndY = max(0,rIndY-1);
        }
        else if(!playerPause){
          keyUp = true;
        }
      }
      if(keyCode == DOWN){
        if(musicboxToggled){
          rIndY = min(2,rIndY+1);
        }
        else if(!playerPause){
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
  if(key == 'z'){
    if(musicboxToggled){
      int index = rIndX + 4*rIndY;
      SoundFile cue = soundCollection.get(index);
      cue.play();
      msg = soundDescription.get(index);
      currMsg = "";
      msgInd = 0;
      narrating = true;
    }
  }
  if(key == '|'){
    town.changeImage(3, spriteHouseRuin1);
    town.changeImage(4, spriteHouseRuin2);
    town.changeImage(5, spriteHouseRuin3);
    town.changeImage(6, spriteHouseRuin1);
    town.changeImage(8, spriteHouseRuin2);
    town.changeImage(9, spriteHouseRuin3);
    town.changeImage(10, spriteHouseRuin1);
    town.changeImage(2, spriteInvisible);
    town.changeImage(7, spriteInvisible);
    town.changeImage(11, spriteInvisible);
    town.changeImage(12, spriteInvisible);
    if(recollectionImages.size() > 0){
      recollectionImages.set(0, recollectionbox);
    }
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
