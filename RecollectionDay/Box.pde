
////////////////////////////////////////////////////
// BOX
//   - Includes Box and Door class
////////////////////////////////////////////////////

class Box{
  public PImage boxTexture;
  public float l; // left
  public float r; // right
  public float b; // bottom
  public float t; // top
  
  public Box(PImage boxTexture, float l, float r, float b, float t){
    this.boxTexture = boxTexture;
    this.l = l;
    this.r = r;
    this.b = b;
    this.t = t;
  }
  
  public void draw(){
    pushMatrix();
    if(this.b > playerY+pHeight){
      translate(0,0,0.15);
    }
    else{
      translate(0,0,0.05);
    }
    beginShape(QUADS);
    texture(boxTexture);
    vertex(l,t,  0,0);
    vertex(r,t,  1,0);
    vertex(r,b,  1,1);
    vertex(l,b,  0,1);
    endShape();
    popMatrix();
  }
}

boolean fadeIn = false;
float fadeTint = 0;
class Door extends Box{
  private String dest;
  public float destX;
  public float destY;
  
  public Door(PImage boxTexture, float l, float r, float b, float t, String dest, float destX, float destY){
    super(boxTexture,l,r,b,t);
    this.dest = dest;
    this.destX = destX;
    this.destY = destY;
  }
  
  public void switchMap(){ // I had pointer problems
    fadeIn = true;
    fadeTint = 0;
    if(dest == "town"){
      println("Set map: town");
      if(map.firstCueException != town){
        map.music.stop();
        firstCue = true;
      }
      map = town;
    }
    else if(dest == "home"){
      println("Set map: home");
      if(map.firstCueException != home){
        map.music.stop();
        firstCue = true;
      }
      map = home;
    }
    else{ // dest == cave
      println("Set map: cave");
      if(map.firstCueException != cave){
        map.music.stop();
        firstCue = true;
      }
      map.music.stop();
      map = cave;
      firstCue = true;
    }
    playerX = destX;
    playerY = destY;
  }
}
