// This class was used for all our buttons in the menu
// It is also used to update the game state, and handle transitions

class Button
{
	float coordX, coordY, buttonWidth, buttonHeight; // button location, dimensions
	String buttonLabel;
	TextBox buttonText;
	States buttonState;
	boolean clicked = false; // boolean to check if button has been clicked

	Button(String label, States state)
	{
		buttonState = state;
		buttonLabel = label;
		buttonText = new TextBox(buttonLabel);
	}

	void display(float textSize, float x, float y, float w, float h)
	{
		update();
		if(mousePressed && mouseHover()) // if mouse has been clicked and it is hovering over the button
		{
			if (!clicked) //ensures it has not been clicked from previously.
			{
				updateState();
				clicked = true;
			}
			else
			{
				clicked = false;
			}
		}
		else if (mousePressed && !mouseHover()) 
		{
			clicked = false;
		}
		rectMode(CENTER);
		stroke(black);
		rect(x, y, w, h);
		buttonText.display(textSize, x, y);
		coordX = x;
		coordY = y;
		buttonWidth = w;
		buttonHeight = h;
	}

	// handles menu transitions and game states
	void updateState()
	{
		if(buttonState == States.MAIN_GAME)
		{
			passengerList.addPassengers();
			mainGamePage.setStartTime(millis());
			switch (Game.difficulty) {
				case 1 :
					mainGamePage.setTimeRemaining(20);
				break;	
				case 2 :
					mainGamePage.setTimeRemaining(15);
				break;	
				case 3 :
					mainGamePage.setTimeRemaining(10);
				break;	
			}
			gameState = buttonState;
		}
		else if (buttonState == States.TRANSITION_PAGE) 
		{
			mainGamePage.updatePassengersAndScoring();
			transitionPage.setTimeBonus(mainGamePage.timer()*2);
			mainGamePage.transition();
			if(mainGamePage.isFinished())
			{
				gameCompletionPage.emptyModifier = scoring.calculateEmptySpace();
				gameState = States.GAME_COMPLETION;
			}
			else 
			{
				gameState = buttonState;
			}
		}
		else if(buttonState == States.LEVEL_SELECTION)
		{
			delay(300);
			gameState = buttonState;
		}
		else 
		{
			gameState = buttonState;
		}
	}

	// Used for radio buttons
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

	// checks if mouse is hovering over button
	boolean mouseHover()
	{
		if(mouseX > (coordX - buttonWidth/2) && mouseX < (coordX + buttonWidth/2) && 
			mouseY > (coordY - buttonHeight/2) && mouseY < (coordY + buttonHeight/2))
		{
			return true;
		}
		return false;
	}

	// update color of button
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
}