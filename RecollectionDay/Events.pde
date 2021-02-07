
////////////////////////////////////////////////////
// EVENTS
//   - Handles interactions, game events
////////////////////////////////////////////////////

boolean startEvent = false;
boolean narrating = false;
boolean conversing = false;
boolean audioCue = false;
SoundFile currCue;
String npcName = "";
boolean playerPause = false;
int time = 0;
int timeout = 180;
String msg = "";
String currMsg = "";
int msgInd = 0;

Box tBox;
Box wBox;
int wCtr = 0;
float tWidth = 154;
boolean trainPass = false;
float trainStop = 4;

void checkEvents(){
  // Train Event
  if(map == town){
    if(trainPass && (playerY < 315 || playerY > 380)){
      trainLeave();
    }
    else if(playerY > 315 && playerY < 380){
      trainPass = true;
      trainArrive();
    }
  }
}

void startEvent(){
  playerPause = true;
  npcName = "Iryna";
  msg = "One of the cows escaped today, it shouldn't have gone too far.\nYet, your father's still looking for it.";
  conversing = true;
}

void trainArrive(){
  tBox.l = max(trainStop,tBox.l - 4);
  tBox.r = tBox.l + tWidth;
  pushMatrix();
  translate(0,0,0.2);
  tBox.draw();
  translate(0,0,-0.01);
  if(tBox.l == trainStop){
    wCtr++;
    if(wCtr == 30){
      float temp = wBox.l;
      wBox.l = wBox.r;
      wBox.r = temp;
    }
    else if(wCtr == 60){
      wCtr = 0;
    }
    wBox.draw();
  }
  popMatrix();
}

void trainLeave(){
  tBox.l -= 4;
  tBox.r = tBox.l + tWidth;
  beginShape(QUADS);
  texture(spriteTrain);
  vertex(tBox.l,tBox.t,0.2,  0,0);
  vertex(tBox.r,tBox.t,0.2,  1,0);
  vertex(tBox.r,tBox.b,0.2,  1,1);
  vertex(tBox.l,tBox.b,0.2,  0,1);
  endShape();
  
  if(tBox.l < -346){
    tBox.l = 200;
    trainCount++;
    trainPass = false;
  }
}

void narrate(String message){
  msgIterate();
  pushMatrix();
  translate(playerX-180, playerY+120, 0.9);
  textFont(narration);
  textAlign(LEFT, LEFT);
  fill(0.4,0.4,1);
  text(message, 0, 0);
  translate(0.9, -0.5);
  fill(0.8,0.8,0.8);
  text(message, 0, 0);
  popMatrix();
}

void converse(String message, String name){
  msgIterate();
  textFont(conversation);
  pushMatrix();
  translate(playerX-195, playerY+80, 0.9);
  
  beginShape(QUADS);
  texture(choicebox); 
  vertex(0,0,  0,0);
  vertex(390,0,  1,0);
  vertex(390,60,  1,1);
  vertex(0,60,  0,1);
  endShape();
  
  textFont(npcTag);
  textAlign(LEFT, LEFT);
  fill(0.2,0.2,0.15);
  translate(25,15);
  text(name, 0, 0); 
  translate(-10,15);
  textFont(conversation);
  text(message, 0, 0);
  popMatrix();
}

void msgIterate(){
  if(currMsg.length() < msg.length()){
    currMsg += msg.charAt(msgInd);
    msgInd++;
  }
  else{
    msg = "";
    time++;
    if(time >= timeout){
      narrating = false;
      conversing = false;
      time = 0;
      currMsg = "";
      msgInd = 0;
    }
  }
}

void interact(int spriteID){
  if(map == town){
    if(spriteID == 1){ // far tree
      msg = "The tree with overreaching arms, dancing fingers with the wind.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
      if(!treeCue){
        treeCue = true;
        addRecollection(tree,"I see men as trees, walking.");
        audioCue = true;
        currCue = tree;
        map.music.pause();
        tree.play();
        playerPause = true;
      }
    }
    else if(spriteID == 2){ // man
      msg = "After roughly a year, the vipers came back. Those pests hide in the\ncrevices of that cave.";
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Dmitry";
      conversing = true;
    }
    else if(spriteID == 7){ // woman
      msg = "Ivan is there, just watching trains all day.";
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Olga";
      conversing = true;
    }
    else if(spriteID == 11){ // boy
      msg = "Mama said to keep far and don't disturb the workers.";
      msg = "Yulia, so many trains are passing by today. You should have seen the\nsixth train, that one's huge!";
      if(ivanConverseCowUnlocked()){
        msg = "The cows are scared, yea. Not because they have to be turned\nto meat, but because they can feel the earthquakes too.";
        ivanConverseCow = true;
      }
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Ivan";
      conversing = true;
    }
    else if(spriteID == 12){ // farmer
      msg = "They who stay behind should feed those in front.\nAt the end, it is all fair."; 
      msg = "They are taking everything, grains, meat, all. We had to harvest early.\nWhat we have in the warehouse is hopefully enough.";
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Farmer Vlad";
      conversing = true;
    }
    else if(spriteID == 13){ // well
      msg = "Mama gets water here everyday. I always looked down\nand wondered how deep the water is.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
      if(!waterCue){
        waterCue = true;
        addRecollection(water,"And through the rivers, they shall not overflow thee.");
        audioCue = true;
        currCue = water;
        map.music.pause();
        water.play();
        playerPause = true;
      }
    }
    else if(spriteID == 14){ // cowpen
      msg = "There are fewer cows in the cowpen now.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
    }
    else if(spriteID == 15){ // far sack
      msg = "Get away from the railroad, child! A train will hit you.";
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Farmer Vlad";
      conversing = true;
    }
    else if(spriteID > 15 && spriteID < 19){ // sacks
      msg = "There are crops are inside the sacks.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
    }
    
  }
  else if(map == home){
    if(spriteID == 0){ // boiler
      msg = "The boiler is heating.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
      if(!boilerCue){
        boilerCue = true;
        addRecollection(boiler,"Which the clouds do drop and distil upon man abundantly.");
        audioCue = true;
        currCue = boiler;
        map.music.pause();
        boiler.play();
        playerPause = true;
      }
    }
    else if(spriteID == 4){ // mom
      msg = "It's sundown. Go to sleep, Yulia.";
      currMsg = "";
      msgInd = 0;
      narrating = false;
      npcName = "Iryna";
      conversing = true;
    }
  }
  else{ // map == cave
  
  }
}

void signalCue(int cueID){
  if(map == town){
    if(cueID == 0){ // train
      if(trainCount == 6  && !trainCue){
        msg = "The train shakes the earth, makes a terrible sound.\nBellows of alert to keep your ground";
        currMsg = "";
        msgInd = 0;
        narrating = true;
        trainCue = true;
        addRecollection(train,"For when they shall say, Peace and safety;\nthen sudden destruction cometh.");
        audioCue = true;
        currCue = train;
        map.music.pause();
        train.play();
        playerPause = true;
      }
    }
    else if(cueID == 1){ // cow
      if(!narrating){
        msg = "The cows seem afraid.";
        currMsg = "";
        msgInd = 0;
        narrating = true;
      }
      if(!cowCue){
        cowCue = true;
        addRecollection(cow,"They bow down together; ..but themselves are gone\ninto captivity.");
        audioCue = true;
        currCue = cow;
        map.music.pause();
        cow.play();
        playerPause = true;
      }
    }
    else if(cueID == 2){ // clearing
      narrating = true;
      if(!clearingEvent && clearingUnlocked()){
        clearingEvent = true;
        msg = "There is a path, the cow must have gone here.";
        playerX -= 20;
        currMsg = "";
        msgInd = 0;
        fadeIn = true;
        fadeTint = 0;
      }
    }
  }
  else if(map == home){
    if(cueID == 0){ // bed
      if(!narrating){
        msg = "Should I go to sleep?";
        currMsg = "";
        msgInd = 0;
        narrating = true;
      }
    }
    if(cueID == 1){ // mom
      map.changeImage(7,spriteMom);
    }
    if(cueID == 2){ // mom
      map.changeImage(7,spriteMomSide);
    }
  }
}
