// Class to handle passenger features, movement

class Passenger
{
	// a lot of different boolean members to handle movement, locking, hiding, etc.
	boolean hover = false;
	boolean clicked = false;
	boolean active = false;
	boolean hadInitialLocationSet = false;
	boolean hide = false;
	boolean locked = false;
	// current location of passenger (based on top left corner)
	float bx = width/20, by = height/2;
	float shapeWidth, shapeHeight;
	int passengerColor = #000000;
	int lineHeight, lineWidth;
	int id;

	Passenger(int hSize, int vSize, int passengerColor)
	{
		lineHeight = vSize;
		lineWidth = hSize;
		shapeWidth = hSize * gridWidth;
		shapeHeight = vSize * gridHeight;
		this.passengerColor = passengerColor;
		id = passengerId++;

		rectMode(CORNER);
	}

	void setStartingLocation(float x, float y)
	{
		bx = x;
		by = y;
		hadInitialLocationSet = true;
	}

	void display() // handles when movement can happen
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
		}
	}

	void mouseReleased()
	{
		clicked = false;
	}

	void redraw() // will only move the passenger for certain conditions
	{ 
		if(active && !overlap() && !seatBlocking() && staysWithinTrain() && !this.locked) 
		// if the passenger is the active passenger to move, does not overlap, can be placed in a valid location, and is not locked from a previous station, then move
		{ 
			move();
			active = false;
		}
	}

	boolean isOnTheTrain() // ensures full passenger is on the train after station leaves
	{
		if ((bx >= gridWidth) && (bx + shapeWidth < 18 * gridWidth) && (by >= 3 * gridHeight) && (by + shapeHeight < 10 * gridHeight))
			return true;
		return false;
	}

	boolean staysWithinTrain() // ensures full passenger stays within the train during placement
	{
		if ((gridMouseX() >= gridWidth) && (gridMouseX() + this.shapeWidth < 18 * gridWidth) && (gridMouseY() >= 3 * gridHeight) && (gridMouseY() + this.shapeHeight < 10 * gridHeight))
			return true;
		return false;
	}

	boolean overlap() // checks to make sure passengers do not overlap
	{
		for(int i = 0; i < passengerList.length(); i++)
		{
			if (!passengerList.at(i).hide && (passengerList.at(i).id != this.id))
			{
				if(horizontalConstraint(passengerList.at(i)) && verticalConstraint(passengerList.at(i)))
				{
					println(i);
					this.active=false;
					this.clicked=false;
					return true;
				}
			}
		}
		return false;
	}
	
	boolean horizontalConstraint(Passenger conflict) // checks for horizontal overlap
	{
		if((((gridMouseX() + this.shapeWidth) > conflict.bx) && (gridMouseX() < conflict.bx)) ||
			((gridMouseX() < (conflict.bx + conflict.shapeWidth)) && ((gridMouseX() + this.shapeWidth) > conflict.bx)))
		{
			return true;
		}
		return false;
	}

	boolean verticalConstraint(Passenger conflict) // checks for vertical overlap
	{
		if((((gridMouseY() + this.shapeHeight) > conflict.by) && (gridMouseY() < conflict.by)) ||
			((gridMouseY() < (conflict.by + conflict.shapeHeight)) && ((gridMouseY() + this.shapeHeight) > conflict.by)))
		{
			return true;
		}
		return false;
	}

	float gridMouseX() // returns corrected mouseX position based on grid coordinates
	{
		float mousex = mouseX;
		return mousex - (mousex % gridWidth);
	}

	float gridMouseY() // returns corrected mouseY position based on grid coordinates
	{
		float mousey = mouseY;
		return mousey - (mousey % gridHeight);
	}

	boolean seatBlocking(){ // checks for different passengers whether they can be placed on seats or in aisles
		if(this.passengerColor == #FFFF00 && this.lineHeight == 3){
			if(((gridMouseX() > 2*gridWidth) && (gridMouseX() < 8*gridWidth)) || 
				((gridMouseX() > 9*gridWidth) && (gridMouseX() < 15*gridWidth))){
				return true;
			}
		}
		else if (this.passengerColor == #FFFF00 && this.lineWidth == 3){
			if(((gridMouseY() > 2*gridHeight) && (gridMouseY() < 5*gridHeight)) || 
				((gridMouseY() > 6*gridHeight) && (gridMouseY() < 9*gridHeight))){
				return true;
			}
		}
		else if (this.passengerColor == #0000FF) {
			if((((gridMouseX() > 1*gridWidth) && (gridMouseX() < 8*gridWidth)) || 
				((gridMouseX() > 8*gridWidth) && (gridMouseX() < 15*gridWidth))) &&
				(((gridMouseY() > 2*gridHeight) && (gridMouseY() < 5*gridHeight)) || 
				((gridMouseY() > 5*gridHeight) && (gridMouseY() < 9*gridHeight)))){
				return true;
			}
		}
		return false;
	}

	void levelLocking(){ // used to lock passengers in place after going to next station
		this.locked = true;
	}
}