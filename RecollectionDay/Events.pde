
////////////////////////////////////////////////////
// EVENTS
//   - Handles interactions, game events
////////////////////////////////////////////////////

boolean startEvent = false;
boolean trainPass = false;
boolean narrating = false;
boolean conversing = false;
boolean audioCue = false;
SoundFile currCue;
String npcName = "Ilot";
boolean playerPause = false;
boolean autoTimeout = true;
int time = 0;
int timeout = 180;
String msg = "They who stay behind should feed those in front.";
String currMsg = "";
int msgInd = 0;

void startEvent(){
  fadeIn = true;
  fadeTint = 0;
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
    if(autoTimeout && time >= timeout){
      narrating = false;
      conversing = false;
      time = 0;
      currMsg = "";
      msgInd = 0;
    }
  }
  
  if(!autoTimeout){
    playerPause = true;
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
      npcName = "Vlad";
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
    else if(spriteID == 15){ // far sack
      msg = "I should not stand in the railroad or the trains will hit me.";
      currMsg = "";
      msgInd = 0;
      narrating = true;
    }
    else if(spriteID > 15 && spriteID < 19){ // sacks
      msg = "Crops are inside the sacks.";
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
      msg = "Your father is coming home. Go to sleep, Yulia.";
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

// HOUSE IDs
// #3,4,5,6,8,9,10
