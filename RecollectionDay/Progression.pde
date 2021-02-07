
////////////////////////////////////////////////////
// PROGRESSION
//   - A bunch of booleans
////////////////////////////////////////////////////


boolean cowCue = false;
int trainCount = 0;
boolean trainCue = false;
boolean ivanConverseCow = false;
boolean clearingEvent = false;
boolean treeCue = false;
boolean boilerCue = false;
boolean waterCue = false;

boolean ivanConverseCowUnlocked(){
  return cowCue && trainCue;
}

boolean clearingUnlocked(){
  return cowCue && trainCue && ivanConverseCow;
}
