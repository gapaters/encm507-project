class Button
{
	float coordX, coordY, buttonWidth, buttonHeight;
	String buttonLabel;
	TextBox buttonText;
	States buttonState;
	boolean clicked = false;
	Button(String label, States state)
	{
		buttonState = state;
		rectMode(CENTER);
		buttonLabel = label;
		buttonText = new TextBox(buttonLabel);
	}

	void display(float text, float x, float y, float w, float h)
	{
		update();
		if(mousePressed && mouseHover())
		{
			gameState = buttonState;
			clicked = true;
		}
		else if (mousePressed && !mouseHover()) {
			clicked = false;
		}

		stroke(black);
		rect(x, y, w, h);
		buttonText.display(text, x, y);
		coordX = x;
		coordY = y;
		buttonWidth = w;
		buttonHeight = h;
	}

	boolean mouseHover()
	{
		if(mouseX > (coordX - buttonWidth/2) && mouseX < (coordX + buttonWidth/2) && 
			mouseY > (coordY - buttonHeight/2) && mouseY < (coordY + buttonHeight/2))
		{
			return true;
		}
		return false;
	}

	void update()
	{
		if (mouseHover() || clicked)
		{
			fill(lightGray);
		}
		else 
		{
			fill(white);
		}
	}

}