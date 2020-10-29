/**
  Class for the vibe object.
  
   @author 
   @version Feb 1st, 2020
``**/

public class Vibe 
{
  private String name;
  private PImage image;
  private boolean achieved;
  private int rarity;

  public Vibe(String vibeName, PImage vibeImage, boolean acheived, int rarity) {
    name = vibeName;
    image = vibeImage;
    this.rarity = rarity;
    this.achieved = acheived;
  }
  public String getName() {
    return name;
  }
  public PImage getImage() {
    return image;
  }
  
  public void setAchieved (boolean tf) {
    this.achieved = tf;
  }
  
  //Checks whether the "vibe" is in the users possession
  public boolean achieved()
  {
    return achieved;
  }
  
  public void displayImage(int xPos, int yPos)
  {
    image(image, xPos, yPos);
  }
  
}
