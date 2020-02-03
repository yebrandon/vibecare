/**
  tracking the VIBES
  
   @author Brandon
   @version Feb 1st, 2020
``**/

import java.text.DateFormatSymbols;
import java.io.*;

class Journal extends textReader
{
  public String date = getMonth(month()) + "  " + Integer.toString(day()) +  ",  " + Integer.toString(year());
  
  public Journal(String temp, int xPos, int yPos){
    super(temp, xPos, yPos);
  }
  
  public String getMonth(int month)
  {
    return new DateFormatSymbols().getMonths()[month-1];
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
        lines = append(lines,date);
        lines = append(lines,entry);
        lines = append(lines,"\n");
        saveStrings(address,lines);
        input = "";
        entryDone = true;
        bar.total++;
        
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
    text (date, width/8, (height/5));
    text (entry, width/8, (height/5)+20);
    text (input, width/8, (height/5)+40);
    
   }
 }
  
  



  
  
  

  
