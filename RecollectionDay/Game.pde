
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
  frameCtr++;
  drawPlayer(frameCtr);
  if(frameCtr == 60){
    frameCtr = 0;
  }
  
  map.drawMapSprites();
  
  // Toggle musicbox
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
    map.music.jump(0);
    firstCue = false;
  }
  else if(!map.music.isPlaying() && !musicboxToggled && !playerPause && !firstCue){
    map.music.play();
    map.music.jump(map.loopEntry);
  }
  else if(audioCue){
    if(!currCue.isPlaying()){
      audioCue = false;
      playerPause = false;
      map.music.play();
    }
  }
  
  // Handle events
  if(narrating){ 
    narrate(currMsg);
  }
  else if(conversing){
    converse(currMsg, npcName);
  }
  
  // Handle map transition
  Door switchMap = map.checkDoors();
  if(switchMap != null){
    switchMap.switchMap();
  }
  if(fadeIn){
    fadeTint += 0.01;
    if(fadeTint >= 1){
      fadeIn = false;
    }
  }
  else if(musicboxToggled){
    fadeTint = 0.5;
  }
  else{
    fadeTint = 1;
  }
  tint(fadeTint);
}
