/**
  tracking the VIBES
  
   @author Brandon
   @version Feb 1st, 2020
``**/

class Tracker
{
  public String[] habits = {"Exercise for 30 minutes every day", "Floss every day", "Go to bed before 11 PM"}; //read habits from text file
  public int[] habitAnswers = new int[habits.length];
  boolean done = false;
  int habitIndex = 0;
  final color BUTTON = #009478;
  public Tracker()
  {

  }
  
 
  
  public void displaySummary()
  {
    final int FORMAT = width/6;
    int g = 168;
    textSize(15);
    noStroke();
    for(int i = 0; i < habits.length; i++)
    {
      g -= 20;
      fill(0, g, 120);
      rect(0, (((height-FORMAT)/habits.length)*i)+FORMAT, width/2, (height-FORMAT)/habits.length);
      fill(0);
      textAlign(CENTER);
      text(habits[i], width/5, (((height-FORMAT)/habits.length)*i)+FORMAT*2); //height-100-(i*(height/habits.length))
      if(habitAnswers[i] == 1)
      {
        fill(0);
        textAlign(LEFT);
        text ("You kept up your habit, nice work!", 3*width/5, (((height-FORMAT)/habits.length)*i)+FORMAT*2);
      }
      else
      {
        fill(0);
        textAlign(LEFT);
        text ("You missed your habit this time, \nbut don't give up!", 3*width/5, (((height-FORMAT)/habits.length)*i)+FORMAT*2);
      }
    }
    fill(0, g, 120);
    rect(0, width/6, width, 20);
    
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text("HABIT TRACKING SUMMARY", width/2, FORMAT+15);
  }
          
public void askHabit(int count)
  {
    if(!done && habitIndex < habits.length)
    {
      textAlign(CENTER);
      text("Do you think you've kept up with this habit today?",width/2,height/2-75);
      text(habits[count], width/2, height/2-50);
      Button yes = new Button(width/4+25, (height/2), BUTTON);
      yes.setText("Yes");
      Button no = new Button(2*width/4+25, (height/2), BUTTON);
      no.setText("No");
     
      if(yes.isOver())
      {
        cursor(HAND);
        if (mousePressed)
        {
          mousePressed = false;
          done = true;
          habitAnswers[habitIndex] = 1;
        }
      }
      else if (no.isOver())
      {
        cursor(HAND);
        if (mousePressed)
        {
          mousePressed = false;
          done = true;
          habitAnswers[habitIndex] = 0;
        }
      }
    }
  }

}
  
  
  

  
  
