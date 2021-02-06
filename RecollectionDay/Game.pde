
////////////////////////////////////////////////////
// GAME
//   - Handles drawing, interactions and game events
////////////////////////////////////////////////////

Map map; // current map
Map town;
Map home;
Map cave;
boolean firstCue = true;

void game(){
  map.draw();
  movePlayer();
    
  // TRACKER
  //println(playerX + ", " + playerY);
    
  frameCtr++;
  drawPlayer(frameCtr);
  if(frameCtr == 60){
    frameCtr = 0;
  }
  
  map.drawMapSprites();
  map.drawDoors();
  
  // Musicbox
  if(musicboxToggled){
    lerpAmt = min(1, lerpAmt+0.1);
    textFont(recollections);
    textAlign(CENTER,CENTER);
    fill(0.6,0.6,0.55);
    text("RECOLLECTIONS", playerX, playerY-100, 1);
    drawRecollections(rCount);
  }
  else{
    lerpAmt = max(0, lerpAmt-0.1);
  }
  mbX = lerp(170,-190,lerpAmt);
  drawMusicbox();
  
  // Handle soundtrack
  if(!map.music.isPlaying() && firstCue){
    map.music.play();
    firstCue = false;
  }
  
  if(!map.music.isPlaying() && !musicboxToggled && !firstCue){
    map.music.play();
    map.music.jump(map.loopEntry);
  }  
}
