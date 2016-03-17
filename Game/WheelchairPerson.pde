class WheelchairPerson implements Passenger
{
	boolean hover = false;
	boolean clicked = false;
	float bx = width/20, by = height/2;
	float shapeWidth = 2 * width/15, shapeHeight = 2* height/9.5; // will need to make variable based on grid shape

	WheelchairPerson()
	{
		rectMode(CENTER);
	}

	void display()
	{
		if (mousePressed && hovering())
		{
			mousePressedAndHovering();
			mouseDragged();
		}
		else if (!mousePressed)
		{
			mouseReleased();
		}

  		rect(bx, by, shapeWidth, shapeHeight);
	}	

	boolean hovering()
	{
		if(mouseX > (bx - shapeWidth/2) && mouseX < (bx + shapeWidth/2) && 
			mouseY > (by - shapeHeight/2) && mouseY < (by + shapeHeight/2))
		{
			hover = true;  
		} 
		else 
		{
			hover = false;
		}
		return hover;
	}

	void mousePressedAndHovering()
	{
		if(hover)
		{
			clicked = true;
		}
		else
		{
			clicked = false;
		}
	}

	void mouseDragged()
	{
		if (clicked)
		{
			bx = mouseX;
			by = mouseY;
		}
	}

	void mouseReleased()
	{
		clicked = false;
	}
}