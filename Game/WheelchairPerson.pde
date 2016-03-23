class WheelchairPerson implements Passenger
{
	boolean hover = false;
	boolean clicked = false;
	float bx = width/20, by = height/2;
	float shapeWidth = 2 * gridWidth, shapeHeight = 2* gridHeight; // will need to make variable based on grid shape

	WheelchairPerson()
	{
		
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
			bx -= bx%(width/18);
			by -= by%(height/13);
		}

		rectMode(CORNER);
  		rect(bx, by, shapeWidth, shapeHeight);
	}	

	boolean hovering()
	{
		if(mouseX > (bx - shapeWidth) && mouseX < (bx + shapeWidth) && 
			mouseY > (by - shapeHeight) && mouseY < (by + shapeHeight))
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