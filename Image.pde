import java.io.File;
import java.util.Random;

public static int [] rarity = new int[0];

public class imageDatabase {
  PImage img, img2;
  Vibe [] vibes;
  
  public String [] getFileNames (){
    File folder;
    String [] filenames;
    folder = new java.io.File (dataPath ("images"));
    filenames = folder.list();
    return filenames;
  } 
  
  public String [] getFileNames2 (){
    File folder;
    String [] filenames;
    folder = new java.io.File (dataPath ("packs"));
    filenames = folder.list();
    return filenames;
  } 
  
  public Vibe[] initializeVibe(String [][] info)
  {
      String [] filenames = getFileNames();
      Vibe [] vibes = new Vibe[filenames.length];
      
      for(int i = 0; i < filenames.length; i++) 
      {
        for(int j = 0; j < info[0].length; j++)
        {
          img = loadImage("images/" + filenames[i]);
          
          vibes[i] = new Vibe(info[i][0], img, false, assignVibe(filenames)[i]);
        }
      }
      return vibes;
  }
  
  public int [] assignVibe (String [] filenames){
    
    rarity = new int[filenames.length];
    
    for (int x = 0; x < rarity.length; x++) {
      if (x < rarity.length*0.5){
          rarity [x] = 0;
      } 
      
      else if (x >= rarity.length*0.5 && x < rarity.length*0.8){
          rarity [x] = 1;
      } 
      
      else {
          rarity [x] = 2;
      }  
    }
    return rarity;
  }
  
  public int cheapPack (){
  Random rand = new Random ();
  int vibeChooser = 0; 
  int rarityChooser = 0;
  int num = rarity.length; 
  float common = num*0.5;
  float rare = num*0.8; 
  int legendary = rarity.length;
   rarityChooser = rand.nextInt(100);
    
    // 85% chance of getting a common (5/100)
    if (rarityChooser < 85){
      // choose a random common
      vibeChooser = (int) (Math.random()*common);
    }
    // 10% chance of getting a rare (5/100)
    else if (rarityChooser >= 85 && rarityChooser < 95){
      // choose a random rare
      vibeChooser = (int) (Math.random()*(rare-common)+common);
    }
    else {
      vibeChooser = (int) (Math.random()*(legendary-rare)+common);      
    }  
    return vibeChooser;
  }
  
  public int mehPack () 
  {
    Random rand = new Random ();
    int vibeChooser = 0; 
    int rarityChooser = 0;
    int num = rarity.length; 
    float common = num*0.5;
    float rare = num*0.8; 
    int legendary = rarity.length;
    rarityChooser = rand.nextInt(100);
    
    // 75% chance of getting a common (5/100)
    if (rarityChooser < 50){
      // choose a random common
      vibeChooser = (int) (Math.random()*common);
    }
    // 10% chance of getting a rare (5/100)
    else if (rarityChooser >= 50 && rarityChooser <85){
      // choose a random rare
      vibeChooser = (int) (Math.random()*(rare-common)+common);
    }
    else {
      vibeChooser = (int) (Math.random()*(legendary-rare)+common);      
    }  
    return vibeChooser;
  }
  
 public int expensivePack ()
 {
    Random rand = new Random ();
    int vibeChooser = 0; 
    int rarityChooser = 0;
    int num = rarity.length; 
    float common = num*0.5;
    float rare = num*0.8; 
    int legendary = rarity.length;
    rarityChooser = rand.nextInt(100);
    
    // 85% chance of getting a common (5/100)
    if (rarityChooser < 30){
      // choose a random common
      vibeChooser = (int) (Math.random()*common);
    }
    // 10% chance of getting a rare (5/100)
    else if (rarityChooser >= 30 && rarityChooser < 75){
      // choose a random rare
      vibeChooser = (int) (Math.random()*(rare-common)+common);
    }
    else {
      vibeChooser = (int) (Math.random()*(legendary-rare)+common);      
    }  
    return vibeChooser;
  }
  
  public void display () 
  {
     tint(255);
     String [] filenames = getFileNames2();
     for (int i = 0; i < filenames.length; i++) {
       img = loadImage ("packs/" + filenames[i]);
        
        //hi bart, ignore this for now, this is just formatting for the store

       image (img, i*width/3+20, 200);
    }
   }
  }
