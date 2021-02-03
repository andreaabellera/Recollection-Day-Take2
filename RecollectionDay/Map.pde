
////////////////////////////////////////////////////
// MAP
//   - Includes Map and Box class
////////////////////////////////////////////////////

class Map{
  private ArrayList<Box> hitBoxes = new ArrayList<Box>();
  private ArrayList<Box> spriteBoxes = new ArrayList<Box>();
  
  public Map(){
  
  }
  
  void draw(){
  
  }
}


class Box{
  public float left;
  public float right;
  public float bottom;
  public float top;
  
  public Box(float left, float right, float bottom, float top){
    this.left = left;
    this.right = right;
    this.bottom = bottom;
    this.top = top;
  }
 
}
