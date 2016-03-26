HScrollbar hs1, hs2;  // Two scrollbars
PImage img1;         // images to load
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

// load the graphs
PImage graphImg;
PImage graphImg1;
PImage graphImg2;
PImage graphImg3;
PImage graphImg4;
PImage graphImg5;
PImage graphImg6;

float alpha1; //The transparency for the images
float alpha2;
float alpha3;
float alpha4;
float alpha5;
float alpha6;

float MAX = 255;

float increase = MAX*5 / width;
float decrease = -MAX*5 / width;
void setup() {
  size(1050, 700);
  noStroke();
  
  hs1 = new HScrollbar(0, (height)-8, width, 16, 16);
  // Load images
  img1 = loadImage("2015.png");
  img2 = loadImage("2014.png");
  img3 = loadImage("2013.png");
  img4 = loadImage("2012.png");
  img5 = loadImage("2011.png");
  img6 = loadImage("2010.png");
  
  graphImg1 = loadImage("graph.jpg");
  graphImg2 = loadImage("graph2.jpg");
  graphImg3 = loadImage("graph3.jpg");
  graphImg4 = loadImage("graph4.jpg");
  graphImg5 = loadImage("graph5.jpg");
  
  alpha1 = MAX; 
  alpha2 = 0;
  alpha3 = 0;
  alpha4 = 0;
  alpha5 = 0;
  alpha6 = 0;
}

void draw() {
  background(0);
  
  // Get the position of the img1 scrollbar
  // and convert to a value to display the img1 image 
  float imgPos = -200;//width/2 - 200; //hs1.getPos() - 100; 
  fill(255);
  float pos = hs1.getPos(); //imgPos + 100;
  
  float icase = pos/(width/5);
  
  //The images are all opaque and different layers become opaque/transparent based on the scroll bar position
  //The transparency calculation is interpolated. 
  
  //transition 1 to 2
  if(icase < 1){
    alpha1 = (1 - icase)*MAX;
    alpha2 = MAX; 
    alpha3 = MAX;
    alpha4 = MAX;
    alpha5 = MAX;
    alpha6 = MAX;

    graphImg = graphImg1;
  }
  else if(icase < 2){
    alpha2 =  (1 - (icase-1))*MAX; 
    alpha3 = MAX; 
    alpha4 = MAX;
    alpha5 = MAX;
    alpha6 = MAX;
    alpha1 = 0;
    graphImg = graphImg2;
  }else if(icase < 3){
    alpha3 = (1 - (icase-2))*MAX;
    alpha4 = MAX; 
    alpha2 = 0;
    alpha1 = 0;
    alpha5 = MAX;
    alpha6 = MAX;
    graphImg = graphImg3;
  }else if(icase < 4){
    alpha4 = (1 - (icase-3))*MAX; 
    alpha5 = MAX; 
    alpha1 = 0;
    alpha2 = 0;
    alpha3 = 0;
    alpha6 = MAX;
    graphImg = graphImg4;
  }else if(icase < 5){
    alpha5 = (1 -(icase-4))*MAX;
    alpha6 = MAX; 
    alpha1 = 0;
    alpha2 = 0;
    alpha3 = 0;
    alpha4 = 0;
    graphImg = graphImg5;
    //print("Fifth case\n");
  }
  
  if (alpha1 > 255){alpha1 = MAX;} //Clamped
  if (alpha2 > 255){alpha2 = MAX;} //Clamped
  if (alpha3 > 255){alpha3 = MAX;} //Clamped
 
  // extra alphas in the house (remove later??)
  if (alpha4 > 255){alpha4 = MAX;} // Clamped
  if (alpha5 > 255){alpha5 = MAX;} // Clamped
  if (alpha6 > 255){alpha6 = MAX;} // Clamped
  
  /* MOUSE COORDINATE EXPERIMENT
  // ~~~~~~~~~~~~~~~~~~~~~~~~~
  // if we are in area 0 to 100, print first map
  if(mouseX % 1000 <= 100)
  {
    alpha1 = 255;
    
    // print graph 1
    tint(255, alpha1);
    image(graphImg, imgPos, height/2);
    
    // print map 1
    tint(255, alpha1);
    image(img1, imgPos, 0);
  }
  
  // if we are in area 100 to 199, print second map
  if(mouseX % 1000 >= 100 && mouseX % 1000 < 200)
  {
    alpha2 = 255;
    
    // print graph 2
    tint(255, alpha2);
    image(graphImg, imgPos, height/2);
    
    // print map 2
    tint(255, alpha2);
    image(img2, imgPos, 0);
  }
  
    // if we are in area 200 to 299, print third map
  if(mouseX % 1000 >= 200 && mouseX % 1000 < 300)
  {
    alpha3 = 255;
    
    // print graph 3
    tint(255, alpha3);
    image(graphImg, imgPos, height/2);
    
    // print map 3
    tint(255, alpha3);
    image(img3, imgPos, 0);
  }
  
  // if we are in area 300 to 399, print fourth map
  if(mouseX % 1000 >= 300 && mouseX % 1000 < 400)
  {
    alpha4 = 255;
    
    // print graph 4
    tint(255, alpha4);
    image(graphImg, imgPos, height/2);
    
    // print map 4
    tint(255, alpha4);
    image(img1, imgPos, 0);
  }
  
  // if we are in area 400 to 599, print fifth map
  if(mouseX % 1000 >= 400 && mouseX % 1000 < 500)
  {
    alpha5 = 255;
    
    // print graph 5
    tint(255, alpha5);
    image(graphImg, imgPos, height/2);
    
    // print map 5
    tint(255, alpha5);
    image(img2, imgPos, 0);
  }
  
  // if we are in area 500 to 599, print sixth map
  if(mouseX % 1000 >= 500 && mouseX % 1000 < 600)
  {
    alpha6 = 255;
    
    // print graph 6
    tint(255, alpha6);
    image(graphImg, imgPos, height/2);
    
    // print map 6
    tint(255, alpha6);
    image(img3, imgPos, 0);
  }
*/

  tint(255, alpha6);
  image(img6, imgPos, 0);
  
  tint(255, alpha5);
  image(img5, imgPos, 0);
  
  tint(255, alpha4);
  image(img4, imgPos, 0);
  
  tint(255, alpha3);
  image(img3, imgPos, 0);
  
  tint(255, alpha2);
  image(img2, imgPos, 0);
  
  tint(255, alpha1);
  image(img1, imgPos, 0);
  
  tint(255, 100);
  image(graphImg, 525, 0);
  
  hs1.update();
  hs1.display();
  
  stroke(0);
}


class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = 0; //xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
 
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}