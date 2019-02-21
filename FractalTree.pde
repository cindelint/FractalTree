private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .4;
public void setup()
{
	size(640,480);
	noLoop();
}
public void draw()
{
	background(165, 191, 204);
	stroke(0);
	strokeWeight(6);
	line(320,480,320,380);
	drawBranches(320,380,80,Math.PI/2);
}
public void drawBranches(int x,int y, double branchLength, double angle)
{
	int finX1, finY1, finX2, finY2;
	double newLength = branchLength * fractionLength;
	double newAng1 = angle + branchAngle;
	double newAng2 = angle - branchAngle;
	finX1 = (int) (x + newLength * Math.cos(newAng1));
	finX2 = (int) (x + newLength * Math.cos(newAng2));
	finY1 = (int) (y - newLength * Math.sin(newAng1));
	finY2 = (int) (y - newLength * Math.sin(newAng2));

	stroke((float) (30-branchLength), (float) (71-branchLength), (float) (29-branchLength));
	strokeWeight((float) branchLength/15);
	line(x,y,finX1,finY1);
	line(x,y,finX2,finY2);

	if (newLength > smallestBranch) {
		drawBranches(finX1, finY1, newLength, newAng1);
		drawBranches(finX2, finY2, newLength, newAng2);
	}
}
