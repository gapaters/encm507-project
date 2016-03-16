class RegularPerson implements Passenger
{
	PShape shape;
	boolean hover = false;
	boolean locked = false;
	float bdifx = 0.0, bdify = 0.0, bx, by;
	float shapeWidth = 1.0, shapeHeight = 2.0;

	void display()
	{
		updateHovering();
  		rect(bx, by, shapeWidth, shapeHeight);
	}

	void updateHovering()
	{
		if (mouseX > bx-shapeWidth && mouseX < bx+shapeWidth && 
			mouseY > by-shapeHeight && mouseY < by+shapeHeight) 
		{
			hover = true;  
			if(!locked) 
			{ 
			  stroke(255); fill(153);
			} 
		} 
		else 
		{
			stroke(153);
			fill(153);
			hover = false;
		}
	}

	void mousePressed()
	{
		if(hover)
		{
			locked = true;
		}
		else
		{
			locked = false;
		}
		bdifx = mouseX - bx;
		bdify = mouseY - by;
	}

	void mouseDragged()
	{
		if (locked)
		{
			bx = mouseX - bdifx;
			by = mouseY - bdify;
		}
	}

	void mouseReleased()
	{
		locked = false;
	}
}