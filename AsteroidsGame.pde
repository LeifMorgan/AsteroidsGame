SpaceShip xwing = new SpaceShip();
Stars [] sky;
public void setup() 
{
  size(700,700);
  sky = new Stars[100];
  for(int i = 0; i < sky.length; i++){
    sky[i] = new Stars();
  }

}
public void draw() 
{
  background(0);
   for(int i = 0; i < sky.length; i++){
    sky[i].show();
  }
  xwing.show();
  xwing.move();
  
 



}

class Stars
{
    private int starX;
    private int starY;
    private int starColor;

    public Stars()
    {
      starX = (int)(Math.random()*700);
      starY = (int)(Math.random()*700);
      starColor = color((int)(Math.random()*200+55),(int)(Math.random()*200+55),(int)(Math.random()*200+55));
    }
    public void show () 
    {
      noStroke();
      fill(starColor);
      ellipse((float)starX,(float)starY, 10.0, 10.0);
    }

}


public void keyPressed(){
  if(key == ' '){
  xwing.setX( ((int)(Math.random()*700)) );  //HYPER SPACE
  xwing.setY( ((int)(Math.random()*700)) );
  xwing.setDirectionX(0);
  xwing.setDirectionY(0);
  }
}



class SpaceShip extends Floater//extends Floater  
{   
  public SpaceShip(){
    int c = -13;
    int e = -21;
    corners = 33;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[ 0] = c + 14;
    yCorners[ 0] = e + 7;
    xCorners[ 1] = c + 23;
    yCorners[ 1] = e + 7;
    xCorners[ 2] = c + 23;
    yCorners[ 2] = e + 6;
    xCorners[ 3] = c + 8;
    yCorners[ 3] = e + 6;
    xCorners[ 4] = c + 8;
    yCorners[ 4] = e + 7;
    xCorners[ 5] = c + 10;
    yCorners[ 5] = e + 7;
    xCorners[ 6] = c + 8;
    yCorners[ 6] = e + 14;
    xCorners[ 7] = c + 6;
    yCorners[ 7] = e + 14;
    xCorners[ 8] = c + 6;
    yCorners[ 8] = e + 17;
    xCorners[ 9] = c + 9;
    yCorners[ 9] = e + 17;
    xCorners[10] = c + 7;
    yCorners[10] = e + 18;
    xCorners[11] = c + 7;
    yCorners[11] = e + 22;
    xCorners[12] = c + 9;
    yCorners[12] = e + 23;
    xCorners[13] = c + 6;
    yCorners[13] = e + 23;
    xCorners[14] = c + 6;
    yCorners[14] = e + 26;
    xCorners[15] = c + 8;
    yCorners[15] = e + 26;
    xCorners[16] = c + 10;
    yCorners[16] = e + 33;
    xCorners[17] = c + 8;
    yCorners[17] = e + 33;
    xCorners[18] = c + 8;
    yCorners[18] = e + 34;
    xCorners[19] = c + 23;
    yCorners[19] = e + 34;
    xCorners[20] = c + 23;
    yCorners[20] = e + 33;
    xCorners[21] = c + 14;
    yCorners[21] = e + 33;
    xCorners[22] = c + 14;
    yCorners[22] = e + 26;
    xCorners[23] = c + 17;
    yCorners[23] = e + 26;
    xCorners[24] = c + 17;
    yCorners[24] = e + 23;
    xCorners[25] = c + 14;
    yCorners[25] = e + 23;
    xCorners[26] = c + 27;
    yCorners[26] = e + 21;
    xCorners[27] = c + 29;
    yCorners[27] = e + 20;
    xCorners[28] = c + 27;
    yCorners[28] = e + 19;
    xCorners[29] = c + 14;
    yCorners[29] = e + 17;
    xCorners[30] = c + 17;
    yCorners[30] = e + 17;
    xCorners[31] = c + 17;
    yCorners[31] = e + 14;
    xCorners[32] = c + 14;
    yCorners[32] = e + 14;

    myColor = color(200,200,200);
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;



}
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)(myCenterX);}   
  public void setY(int y) {myCenterY = y;}   
  public int getY() {return (int)(myCenterY);}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);   

    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesofRotation)   
  {     


     myPointDirection += nDegreesofRotation;
  }   


  public void move ()   //move the floater in the current direction of travel
  {      

    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }  
    

//Tangent of mouseY - (mouseY - xwingY)   over    mouseX - (mouseX - xwingX) to get the point direction facing the mouse


    if (mouseX>xwing.getX() && mouseY<xwing.getY())
     {
      myPointDirection = (-1)*(180/Math.PI)*Math.atan(Math.abs((double)mouseY - (double)xwing.getY())/Math.abs((double)mouseX - (double)xwing.getX()));
     }

     //second quadrant
     if (mouseX<xwing.getX() && mouseY<xwing.getY())
     {
      myPointDirection = 180 + (180/Math.PI)*Math.atan(Math.abs((double)mouseY - (double)xwing.getY())/Math.abs((double)mouseX - (double)xwing.getX()));
     }
     //third quadrant
     if (mouseX<xwing.getX() && mouseY>xwing.getY())
     {
      myPointDirection = 180 - (180/Math.PI)*Math.atan(Math.abs((double)mouseY - (double)xwing.getY())/Math.abs((double)mouseX - (double)xwing.getX()));
     }
     //fourth quadrant
     if (mouseX>xwing.getX() && mouseY>xwing.getY())
     {

      myPointDirection = (180/Math.PI)*Math.atan(Math.abs((double)mouseY - (double)xwing.getY())/Math.abs((double)mouseX - (double)xwing.getX()));
     }
 

     if(keyPressed && key == 'w'){
      xwing.accelerate(0.2);
     } if(keyPressed && key == 's'){
      xwing.accelerate(-0.2);
     } 




  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

