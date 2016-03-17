class RegularPerson implements Passenger
{
	boolean hover = false;
	boolean clicked = false;
	float bx = width/20, by = height/2;
	float shapeWidth = width/15, shapeHeight = height/9.5; // will need to make variable based on grid shape

	RegularPerson()
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