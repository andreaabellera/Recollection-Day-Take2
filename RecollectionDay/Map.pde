
////////////////////////////////////////////////////
// MAP
//   - Includes Map class
////////////////////////////////////////////////////

class Map{
  private PImage background;
  public SoundFile music;
  public float loopEntry;
  private float mWidth;
  private float mHeight;
  private ArrayList<Box> hitBoxes = new ArrayList<Box>();
  private ArrayList<Box> spriteBoxes = new ArrayList<Box>();
  
  public Map(PImage background, SoundFile music, float loopEntry, float mWidth, float mHeight){
    this.background = background;
    this.music = music;
    this.loopEntry = loopEntry;
    this.mWidth = mWidth;
    this.mHeight = mHeight;
  }
  
  public void draw(){
    beginShape(QUADS);
    texture(background);
    vertex(-mWidth,-mHeight,  0,0);
    vertex(mWidth,-mHeight,  1,0);
    vertex(mWidth,mHeight,  1,1);
    vertex(-mWidth,mHeight,  0,1);
    endShape();
  }
  
  public void addMapSprites(Box sprite){
    spriteBoxes.add(sprite);
  }
  
  public void addHitbox(Box hitbox){
    hitBoxes.add(hitbox);
  }
  
  public void drawMapSprites(){
    for(int i = 0; i < spriteBoxes.size(); i++){
      spriteBoxes.get(i).draw();
    }
  }
  
}
