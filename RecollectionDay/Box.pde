
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
  public float boxWidth;
  public float boxHeight;
  
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


class Door extends Box{
  private Map dest;
  private float destX;
  private float destY;
  
  public Door(PImage boxTexture, float l, float r, float b, float t, Map dest, float destX, float destY){
    super(boxTexture,l,r,b,t);
    this.dest = dest;
    this.destX = destX;
    this.destY = destY;
  }

}
