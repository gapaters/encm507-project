class Button
{
	float coordX, coordY, buttonWidth, buttonHeight;
	String buttonLabel;
	TextBox buttonText;
	States buttonState;
	boolean clicked = false;
	boolean pressed = false;

	Button(String label, States state)
	{
		buttonState = state;
		rectMode(CENTER);
		buttonLabel = label;
		buttonText = new TextBox(buttonLabel);
	}

	void display(float textSize, float x, float y, float w, float h)
	{
		update();
		if(mousePressed && mouseHover())
		{
			if (!clicked)
			{
				updateState();
				clicked = true;
			}
			else
			{
				clicked = false;
				delay(300);
			}
		}
		else if (mousePressed && !mouseHover()) 
		{
			clicked = false;
		}

		stroke(black);
		rect(x, y, w, h);
		buttonText.display(textSize, x, y);
		coordX = x;
		coordY = y;
		buttonWidth = w;
		buttonHeight = h;
	}

	void updateState()
	{
		if(buttonState == States.MAIN_GAME)
		{
			mainGamePage.setStartTime(millis());
			gameState = buttonState;
		}
		else if (buttonState == States.TRANSITION_PAGE) 
		{
			mainGamePage.transition();
			//println("transition");
			if(mainGamePage.isFinished())
			{
				//println("game complete");
				gameState = States.GAME_COMPLETION;
				//println(gameState);
			}
			else 
			{
				gameState = buttonState;
			}
		}
		else 
		{
			gameState = buttonState;
		}
	}

	void displayWithoutUpdatingState(float textSize, float x, float y, float w, float h)
	{
		update();
		if(mousePressed && mouseHover())
		{
			clicked = true;
		}
		else if (mousePressed && !mouseHover()) 
		{
			clicked = false;
		}

		stroke(black);
		rect(x, y, w, h);
		buttonText.display(textSize, x, y);
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

	void setText(String text)
	{
		buttonLabel = text;
		buttonText.setText(text);
	}

	void setState(States state)
	{
		buttonState = state;
	}
}