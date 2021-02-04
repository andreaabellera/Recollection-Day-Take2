
////////////////////////////////////////////////////
// MAP
//   - Includes Map class
////////////////////////////////////////////////////

class Map{
  private PImage background;
  private SoundFile music;
  private ArrayList<Box> hitBoxes = new ArrayList<Box>();
  private ArrayList<Box> spriteBoxes = new ArrayList<Box>();
  
  public Map(PImage background, SoundFile music){
    this.background = background;
    this.music = music;
  }
  
  public void playTheme(){
    music.loop();
  }
  
  public void stopTheme(){
    music.stop();
  }
  
  public void draw(){
    //image(background, 300, 50, 200, 500);
    beginShape(QUADS);
    texture(background);
    vertex(-100,-250,  0,0);
    vertex(100,-250,  1,0);
    vertex(100,250,  1,1);
    vertex(-100,250,  0,1);
    endShape();
  }
  
}
