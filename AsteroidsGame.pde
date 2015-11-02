SpaceShip xwing = new SpaceShip();
public void setup() 
{
  size(500,500);
}
public void draw() 
{
  xwing.show();
}
class SpaceShip extends Floater//extends Floater  
{   
  public SpaceShip(){
    corners = 32;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[ 0] = 14;
    yCorners[ 0] = 7;
    xCorners[ 1] =23;
    yCorners[ 1] =7;
    xCorners[ 2] =23;
    yCorners[ 2] =6;
    xCorners[ 3] =8;
    yCorners[ 3] =6;
    xCorners[ 4] =8;
    yCorners[ 4] =7;
    xCorners[ 5] =10;
    yCorners[ 5] =7;
    xCorners[ 6] =8;
    yCorners[ 6] =14;
    xCorners[ 7] =6;
    yCorners[ 7] =14;
    xCorners[ 8] =6;
    yCorners[ 8] =17;
    xCorners[ 9] =9;
    yCorners[ 9] =17;
    xCorners[10] =7;
    yCorners[10] =18;
    xCorners[11] =7;
    yCorners[11] =22;
    xCorners[12] =9;
    yCorners[12] =23;
    xCorners[13] =6;
    yCorners[13] =23;
    xCorners[14] =6;
    yCorners[14] =26;
    xCorners[15] =8;
    yCorners[15] =26;
    xCorners[16] =10;
    yCorners[16] =33;
    xCorners[17] =8;
    yCorners[17] =33;
    xCorners[18] =8;
    yCorners[18] =34;
    xCorners[19] =23;
    yCorners[19] =34;
    xCorners[20] =23;
    yCorners[20] =33;
    xCorners[21] =14;
    yCorners[21] =33;
    xCorners[22] =14;
    yCorners[22] =26;
    xCorners[23] =17;
    yCorners[23] =26;
    xCorners[24] =17;
    yCorners[24] =23;
    xCorners[25] =14;
    yCorners[25] =23;
    xCorners[26] =27;
    yCorners[26] =21;
    xCorners[27] =29;
    yCorners[27] =20;
    xCorners[28] =27;
    yCorners[28] =19;
    xCorners[29] =14;
    yCorners[29] =17;
    xCorners[30] =17;
    yCorners[30] =17;
    xCorners[31] =17;
    yCorners[31] =14;
    xCorners[32] =14;
    yCorners[32] =14;
    myColor = color(0,0,200);
    setX(250);
    setY(250);
    setDirectionX(0);
    setDirectionY(0);
    setPointDirection(270);


  }
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)(myCenterX);}   
  public void setY(int y) {myCenterY = y;};   
  public int getY() {return (int)(myCenterX);}   
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
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
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

