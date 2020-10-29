/**
  Class for creating the menu bar. Includes users name, screen title, 
  and total amount of money.
  
   @author Barrett
   @version Feb 1st, 2020
``**/

class Bar
{
  private String name;
  private String title;
  private int total;
  private final int WIDTH = width/16;
  private color colour;
  
  public Bar(String name, String title, int total, color colour)
  {
    this.name = name;
    this.title = title;
    this.total = 10000; //DEMO ONLY
    this.colour = colour;
  }
  
  //Accessors
  public int getTotal()
  {
    return total;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public String getYName()
  {
    return name;
  }
  
  private void setYName(String newName)
  {
    name = newName;
  }
  
  private void setTitle(String newTitle)
  {
    title = newTitle;
  }
  
  private void setAmount(int amount)
  {
    total = amount;
  }
  
  private void display()
  {
    fill(colour);
    noStroke();
    textSize(20);
    rect(0, 0, width, WIDTH);
    
    //name
    fill(0);
    textAlign(LEFT);
    text((this.name).toUpperCase(), 0, WIDTH/2);
    
    textAlign(RIGHT);
    text(formatCoin(total), width, WIDTH/2);
    
    textAlign(CENTER);
    text(this.title, width/2, WIDTH/2);
  }
  
  private String formatCoin(int total)
  {
    String formated = total + " CareCoins";
    
    return formated;
  }
  
}
