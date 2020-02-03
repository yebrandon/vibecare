/**
  Collection Object?
 **/

class Collection
{
  private Vibe [] collection;
  //private imageDatabase collection;
  private boolean display;
  
  public Collection(Vibe [] collection)
  {
    this.collection = collection;
  }
  
  private void window()
  {
    rect(width/14, width/5, (width/14)*12, height - (width/7)*2);
  }
  
  private void display()
  {
    window();
    int y = 0;
    int x = 0;
    
    for(int i = 0; i < collection.length; i++)
    {
      collection[i].getImage().resize(75, 75);
      
      if(x > 10)
      {
        x = 0;
        y += 60;
      }
      
      if(collection[i].achieved() == true)
      {
        tint(255);
      }
      else
      {
        tint(25,25,25);
      }
      
      collection[i].displayImage((x*width/14)+50, (width/5)+y);
      x++;
    }
  }
  
  
  //public void shown
  
}
