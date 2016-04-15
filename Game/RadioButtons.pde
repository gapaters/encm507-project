// Class to handle radio buttons, which is a list of buttons. Only used for difficulty setting

class RadioButtons
{
	Button[] buttons;
	int selectedButton;

	RadioButtons(String labels[], States states[])
	{
		if (labels.length != states.length)
		{
			println("RadioButtons - Lengths are not matching! # of labels = ", labels.length, 
				" , # of States: ", states.length);
		}
		else
		{
			buttons = new Button[labels.length];
			for (int i = 0; i < labels.length; i++)
			{
				buttons[i] = new Button(labels[i], states[i]);
			}
		}
	}

	void display(float textSize, float x, float y, float w, float h)
	{
		for (int i = 0; i < buttons.length; i++)
		{
			buttons[i].update();
			buttons[i].displayWithoutUpdatingState(textSize, x, y + i * height/5, w, h);
			if (buttons[i].clicked)
			{
				selectedButton = i;
				Game.difficulty = i + 1;
			}
		}
	}

	States getDifficulty()
	{
		return buttons[selectedButton].buttonState;
	}

}