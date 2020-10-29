/**
  Class for button formatting.
  
   @author Terry
   @version Feb 1st, 2020
``**/
public class Button {
  private String name = "";
  private int xPos, yPos;
  final int BUT_SIZE_X = 125, BUT_SIZE_Y = 50;
  private color colour;

  public Button(String inputName, int inputX, int inputY) {
    name=inputName;
    xPos=inputX;
    yPos=inputY;
    createButton();
  }
  
  public Button(int inputX, int inputY, color colour) {
    xPos = inputX;
    yPos = inputY;
    this.colour = colour;
    createButton();
  }
  
  //public Button(int inputX, int inputY) {
  //  xPos = inputX;
  //  yPos = inputY;
  //  createButton();
  //}
  
  private void createButton() {
    strokeWeight(5);
    fill(colour);
    rect(xPos, yPos, BUT_SIZE_X, BUT_SIZE_Y, 12);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(BUT_SIZE_Y/3);
    text(name, (BUT_SIZE_X/2)+xPos, (BUT_SIZE_Y/2)+yPos);
  }
  
  public void createButton (int x, int y){
    fill(colour);
    rect(x, y, 200, 200);
    fill(0);
  }  
  
  public void setText(String inputName) {
    name=inputName;
    createButton();
  }
  
  public int getX() {
    return xPos;
  }

  public int getY() {
    return yPos;
  }

  public void update(int newPos) {
    xPos=newPos;
    createButton();
  }
  
  public boolean isOver() {
    return (mouseX>xPos) && (mouseX<xPos+BUT_SIZE_X) && (mouseY>yPos) && (mouseY<yPos+BUT_SIZE_Y);
  }
  
  public boolean isOverPack() {
    return (mouseX>xPos) && (mouseX<xPos+200) && (mouseY>yPos) && (mouseY<yPos+400);
  }
}
