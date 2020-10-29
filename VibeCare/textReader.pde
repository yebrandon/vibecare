
import java.io.*;

class textReader
{
  public String input = "";
  public String entry= "";  
  boolean entryDone = false;
  String address;
  int xPos,yPos;
  
  public textReader(String temp, int inputX, int inputY){
    address=temp;
    int xPos=width/8;
  }
  
  void displayText()
  {
    textAlign(LEFT); 
    text("My Journal Entries",width/8,height/5);
    String[] lines = loadStrings(address);
    for (int i = 0; i < lines.length; i++)
    {
      text(lines[i],width/8,(height/5)+(20*i) + 20);
    }
  }
  void displayText(int inputX, int inputY)
  {
    String[] lines = loadStrings(address);
    textAlign(LEFT); 
    for (int i = 0; i < lines.length; i++)
    {
      text(lines[i],inputX,inputY+(20*i));
    }
  }
  
  void type()
  {
      // If the return key is pressed, save the String and clear it
      if (key == '\n' ) 
      {
        entry = input;
        entry = entry.replaceAll("[\n]", "");
        input = "";
        //write to file
        String[] lines = loadStrings(address);
        lines = append(lines,entry);
        lines = append(lines,"\n");
        saveStrings(address,lines);
        input = "";
        entryDone = true;
        
      }
      
      if (key == BACKSPACE)
      {
        if(input.length() > 0)
        {
          input = input.substring(0, input.length()-1);
        }
      }
      else 
      {
        // Otherwise, concatenate the String
        // Each character typed by the user is added to the end of the String variable.
        input = input + key; 
      }
  }
    public void promptEntry(String entry)
  {
    
    textAlign(LEFT);
    text (entry, width/8, (height/5)+20);
    text (input, width/8, (height/5)+40);
    
   }
   public boolean entryDone(){
     return entryDone;
   }

 }
  
  



  
  
  

  
