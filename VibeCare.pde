public static int currency;
int time = millis(),screen;
Tracker tracker = new Tracker();
Journal journal = new Journal("journal.txt",width/8,height/5);
Button menu[] = new Button[5],packs [] = new Button [3];
Bar bar;
imageDatabase img;
Collection collect;
Vibe [] vibes;
PFont font;
final color BACKGROUND = 255,TEST = #000000,BUTTON = #009478,BAR = #00A878;
PImage image;
String purchase = "";
String[] personInfo;
textReader tr = new textReader("person.txt",width/8,height/5);;

void setup() 
{
  
  size(700, 700);
  personInfo=loadStrings("person.txt");
  if(personInfo.length == 0||personInfo[0].length() == 0||personInfo.equals(" ")){
    bar = new Bar("", "MENU", 0, BAR);
    screen = -1;
  }else{
  bar = new Bar(personInfo[0], "MENU", 0, BAR);
  screen = 0;
  }
  surface.setTitle("Vibe Care");
  font = loadFont("font.vlw");
  String [][] info;
  info = initializeInfo();
  img = new imageDatabase();
  vibes = img.initializeVibe(info);
  collect = new Collection(vibes);
  image = loadImage("logo.png");

  for (int i=0; i < menu.length; i++) 
  {
    menu[i] = new Button(width/5, width/12, BUTTON);
  }

  for (int i=0; i < packs.length; i++) 
  {
    packs[i] = new Button(i*width/3+20, 200, TEST);
  }

  menu[0].setText("Home\nScreen");
  menu[1].setText("Journal");
  menu[2].setText("Tracker");
  menu[3].setText("Collection");
  menu[4].setText("Store");
}

void draw() 
{
  if ((millis() > time + 10000) && screen != 2)
  {
    time = millis();
    tracker.done = false;
    tracker.habitIndex = 0;
  }
  background(BACKGROUND);
  textFont(font);

  for (int i=0; i< menu.length; i++) 
  {
    menu[i].update(i*(width/5)+7);
  }

  if (menu[0].isOver()||menu[1].isOver()||menu[2].isOver()||menu[3].isOver()||menu[4].isOver())
  {
    cursor(HAND);
  } else
  {
    cursor(ARROW);
  }
  if (screen ==-1){
    tr.promptEntry("Hey there! Welcome to Vibe Care! Please enter your name to begin!");
    tr.displayText(width/2,height/2);
  }
  if (screen == 0)
  {
    tint(255);
    imageMode(CENTER);
    image(image, width/2, height/2);
    imageMode(CORNER);
  }
  if (screen == 1)
  {
    if(journal.entryDone)
    {
      screen = 7;
    }
    else
    {
      journal.promptEntry("Type a new journal entry for today!");
    }
  }
  if(screen == 7)
  {
    //read from file and display
    journal.displayText(); 
  }
  if (screen == 2)
  {
    if (!tracker.done)
    {
      tracker.askHabit(tracker.habitIndex);
    } else
    {
      tracker.habitIndex++;
      tracker.done = false;
      bar.total++;
    }
    if (tracker.habitIndex > tracker.habits.length-1)
    {
      tracker.displaySummary();
    }
  }
  if (screen == 3)
  {
    collect.display();
  }
  if (screen == 4)
  {
    
    img.display();
    for(int i=0; i < packs.length; i++)
    {
      //packs[i].createButton(i*width/3+20, 200, TEST);
      //vibes = img.initializeVibe(initialize(info));
    }
    if(packs[0].isOverPack() && bar.getTotal() >= 30 && mousePressed) 
    {
      mousePressed = false;
      int index = img.cheapPack();
      int reduce = bar.getTotal();
      reduce -= 30;
      print (index);
      bar.setAmount (reduce);
      vibes [index].setAchieved (true);
      purchase = "You recieved " + vibes[index].name + ", a " + rarityToWord(vibes[index].rarity) + " vibe!";
    } else if (packs[1].isOverPack() && bar.getTotal() >= 60 && mousePressed) {
      mousePressed = false;
      int index = img.mehPack();
      int reduce = bar.getTotal();
      reduce -= 60;
      print (index);
      bar.setAmount (reduce);
      vibes [index].setAchieved (true);
      purchase = "You recieved " + vibes[index].name + ", a " + rarityToWord(vibes[index].rarity) + " vibe!";
    } else  if (packs[2].isOverPack() && bar.getTotal() >= 150 && mousePressed) {
      mousePressed = false;
      int index = img.expensivePack();
      int reduce = bar.getTotal();
      reduce -= 150;
      print (index);
      bar.setAmount (reduce);
      vibes [index].setAchieved (true);
      purchase = "You recieved " + vibes[index].name + ", a " + rarityToWord(vibes[index].rarity) + " vibe!";
    }
    text(purchase,width/2,9*height/10);
  }
  
  bar.display();
}  

void mousePressed() {
  if(screen!=-1){
  if (menu[0].isOver()) {
    screen=0;
    bar.setTitle("MENU");
  } else if (menu[1].isOver()) {
    screen=1;
    bar.setTitle("JOURNAL");
  } else if (menu[2].isOver()) {
    screen=2;
    bar.setTitle("TRACKER");
  } else if (menu[3].isOver()) {
    screen=3;
    bar.setTitle("COLLECTION");
  } else if (menu[4].isOver())
  {
    screen = 4;
    bar.setTitle("STORE");
  }
  }
}

void keyPressed()
{
  if(screen == 1){  
  journal.type();
  if(journal.entryDone()){
  screen = 7;
  }
  }if(screen == -1){  
  tr.type();
  if(tr.entryDone()){
    bar = new Bar(tr.entry, "MENU", 0, BAR);
    screen=0;
  }
  }
}
