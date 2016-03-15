class RadioButtons
{
	Button[] buttons;
	int selectedButton;

	RadioButtons(String labels[], States states[])
	{
		if (labels.length != states.length)
		{
			println("RadioButtons - Lengths are not matching! # of labels = %d, # of States: %d", 
				labels.length, states.length);
		}

		buttons = new Button[labels.length];
		for (int i = 0; i < labels.length; i++)
		{
			buttons[i] = new Button(labels[i], states[i]);
		}
	}

	void display()
	{

	}

}