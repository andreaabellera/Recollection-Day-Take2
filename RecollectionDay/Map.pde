
////////////////////////////////////////////////////
// MAP
//   - Includes Map class
////////////////////////////////////////////////////

class Map{
  private PImage background;
  public SoundFile music;
  public float loopEntry;
  public float mWidth;
  public float mHeight;
  private ArrayList<Box> hitBoxes = new ArrayList<Box>();
  private ArrayList<Box> spriteBoxes = new ArrayList<Box>();
  private ArrayList<Door> doors = new ArrayList<Door>();
  
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
  
  public void addDoor(Door door){
    doors.add(door);
  }
  
  public void drawMapSprites(){
    for(int i = 0; i < spriteBoxes.size(); i++){
      spriteBoxes.get(i).draw();
    }
  }
  
  public void checkCollisions(){
    boolean collideX = false;
    boolean collideY = false;
    for(int i = 0; i < hitBoxes.size(); i++){
      Box box = hitBoxes.get(i);
      collideX = collide(pHitbox.l,pHitbox.r,  box.l,box.r);
      collideY = collide(pHitbox.t,pHitbox.b,  box.t,box.b);
      if(collideX && collideY){ 
        if(collideX){
          playerX = lastX;
        }
        if(collideY){
          playerY = lastY;
        }
      }
    }
  }
  
  private boolean collide(float pStart, float pEnd, float bStart, float bEnd){
    return (pStart <= bEnd && pEnd >= bStart);
  }
  
  public void drawHitboxes(){
    for(int i = 0; i < hitBoxes.size(); i++){
      hitBoxes.get(i).draw();
    }
  }
  
  public void drawDoors(){
    for(int i = 0; i < doors.size(); i++){
      pushMatrix();
      translate(0,0,0.25);
      doors.get(i).draw();
      popMatrix();
    }
  }
  
}
