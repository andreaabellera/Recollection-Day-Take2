
////////////////////////////////////////////////////
// EVENTS
//   - Handles interactions, game events
////////////////////////////////////////////////////

boolean startEvent = false;
boolean trainPass = false;
boolean narrating = false;
boolean conversing = false;
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
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    else if(spriteID == 2){ // man
      msg = "They who stay behind should feed those in front.";
      conversing = true;
    }
    else if(spriteID == 7){ // woman
      msg = "They who stay behind should feed those in front.";
      conversing = true;
    }
    else if(spriteID == 11){ // boy
      msg = "They who stay behind should feed those in front.";
      conversing = true;
    }
    else if(spriteID == 12){ // farmer
      msg = "They who stay behind should feed those in front.";
      conversing = true;
    }
    else if(spriteID == 13){ // well
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    else if(spriteID == 14){ // cowpen
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    else if(spriteID == 15){ // far sack
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    else if(spriteID > 15 && spriteID < 19){ // sacks
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    
  }
  else if(map == home){
    if(spriteID == 0){ // boiler
      msg = "They who stay behind should feed those in front.";
      narrating = true;
    }
    else if(spriteID == 4){ // mom
      msg = "Yulia, go to sleep Ilot.";
      npcName = "Iryna";
      conversing = true;
    }
  }
  else{ // map == cave
  
  }
}

// HOUSE IDs
// #3,4,5,6,8,9,10
