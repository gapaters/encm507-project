class WheelchairPerson implements Passenger
{
	boolean hover = false;
	boolean clicked = false;
	boolean active = false;
	float bx = width/20, by = height/2;
	float shapeWidth = 2 * gridWidth, shapeHeight = 2* gridHeight; // will need to make variable based on grid shape

	WheelchairPerson()
	{
		rectMode(CORNER);
	}

	void display()
	{
		if (mousePressed && hovering())
		{
			mousePressedAndHovering();
		}
		else if (mousePressed) {
			redraw();
		}
		else if (!mousePressed)
		{
			mouseReleased();
			bx -= bx%(gridWidth);
			by -= by%(gridHeight);
		}

		rectMode(CORNER);
  		rect(bx, by, shapeWidth, shapeHeight);
	}	

	boolean hovering()
	{
		if(mouseX > (bx) && mouseX < (bx + shapeWidth) && 
			mouseY > (by) && mouseY < (by + shapeHeight))
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
			active = true;
		}
		else
		{
			clicked = false;
		}
	}

	void move()
	{
		if (active)
		{
			bx = mouseX;
			by = mouseY;
		}
	}

	void mouseReleased()
	{
		clicked = false;
	}

	void redraw(){
		if(active){
			move();
			active = false;
		}
	}
}