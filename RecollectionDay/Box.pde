
////////////////////////////////////////////////////
// BOX
//   - Includes Box class
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
    beginShape(QUADS);
    texture(boxTexture);
    vertex(l,t,0.15,  0,0);
    vertex(r,t,0.15,  1,0);
    vertex(r,b,0.15,  1,1);
    vertex(l,b,0.15,  0,1);
    endShape();
  }
}
