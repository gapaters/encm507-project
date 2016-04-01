class Passenger
{
	boolean hover = false;
	boolean clicked = false;
	boolean active = false;
	boolean hadInitialLocationSet = false;
	boolean hide = false;
	float bx = width/20, by = height/2;
	float shapeWidth, shapeHeight; // will need to make variable based on grid shape
	int passengerColor = #000000;
	int lineHeight, lineWidth;

	Passenger(int hSize, int vSize)
	{
		lineHeight = vSize;
		lineWidth = hSize;
		shapeWidth = hSize * gridWidth;
		shapeHeight = vSize * gridHeight;

		rectMode(CORNER);
	}

	Passenger(int hSize, int vSize, int passengerColor)
	{
		shapeWidth = hSize * gridWidth;
		shapeHeight = vSize * gridHeight;
		this.passengerColor = passengerColor;

		rectMode(CORNER);
	}

	void setStartingLocation(float x, float y)
	{
		bx = x;
		by = y;
		hadInitialLocationSet = true;
	}

	void display()
	{
		if (!hide)
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

			fill(passengerColor);
			rectMode(CORNER);
	  		rect(bx, by, shapeWidth, shapeHeight);
  		}
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
			//println("Moved, isOnTheTrain?: " + this.isOnTheTrain());
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

	boolean isOnTheTrain()
	{
		if ((bx >= gridWidth) && (bx + shapeWidth < 18 * gridWidth) && (by >= 3 * gridHeight) && (by + shapeHeight < 10 * gridHeight))
			return true;
		return false;
	}
}