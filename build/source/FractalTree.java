import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FractalTree extends PApplet {

private double fractionLength = .8f;
private int smallestBranch = 10;
private double branchAngle = .2f;
public void setup()
{
	
	noLoop();
}
public void draw()
{
	background(140);
	stroke(0);
	line(320,480,320,380);
	drawBranches(320,380,80,Math.PI);
}
public void drawBranches(int x,int y, double branchLength, double angle)
{
	int finX1, finY1, finX2, finY2;
	double newLength = branchLength * fractionLength;
	double newAng = angle * branchAngle;
	finX1 = (int) (x + newLength * Math.cos(newAng));
	finX2 = (int) (x - newLength * Math.cos(newAng));
	finY1 = (int) (y - newLength * Math.sin(newAng));
	finY2 = (int) (y - newLength * Math.sin(newAng));

	line(x,y,finX1,finY1);
	line(x,y,finX2,finY2);

	if (newLength > smallestBranch) {
		drawBranches(finX1, finY1, newLength, newAng);
		drawBranches(finX2, finY2, newLength, newAng);
	}
}
  public void settings() { 	size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FractalTree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
