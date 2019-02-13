private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;
public void setup()
{
	size(640,480);
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
