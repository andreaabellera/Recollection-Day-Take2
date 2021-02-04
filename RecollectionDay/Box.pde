
////////////////////////////////////////////////////
// BOX
//   - Includes Box class
////////////////////////////////////////////////////

class Box{
  public PImage texture;
  public float left;
  public float right;
  public float bottom;
  public float top;
  public float bWidth;
  public float bHeight;
  
  public Box(PImage texture, float left, float right, float bottom, float top){
    this.texture = texture;
    this.left = left;
    this.right = right;
    this.bottom = bottom;
    this.top = top;
  }
}
