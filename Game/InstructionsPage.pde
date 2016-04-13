class InstructionsPage
{
	TextBox title, objective, instructions, scoring, levels, rules;
	Button playButton, menuButton;
	InstructionsPage()
	{
		title = new TextBox("Instructions");
		objective = new TextBox("Fill the train with as many passengers as possible within the time period");
		rules = new TextBox("There are four types of passengers: " + 
			"Standard passengers (red, 1x1), " +
			"Passengers with a bag (green, 1x2/2x1), " + 
			"Wheelchair users (blue, 2x2), " + 
			"and Bikers (yellow, 1x3/3x1)." + 
			"\n\nPassengers with or without a bag can be placed on the seats or in the aisles (dark blue tiles), " + 
			"while the wheelchairs and bikes must be placed in the aisles (gray tiles). " + 
			"If you finish before time expires, you can close the doors faster for bonus points. " +
			"However, once the train moves to the next station, passengers already placed on the train cannot be moved again");
		instructions = new TextBox("Using your mouse, select a passenger to move. Click the upper right location on the grid to seat the passenger.");
		scoring = new TextBox("Points will be awarded for: " + 
			"\n- Getting as many passengers on the train " + 
			"\n- Reducing as much empty space on the train " + 
			"\n- Placing similar colored passengers beside each other " + 
			"\n- Finishing the station as fast as possible");
		levels = new TextBox("More difficult levels will more people getting on at each station, and less time to get them on board");
		playButton = new Button("Play", States.LEVEL_SELECTION);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		objective.display(
			height/50, width/2, height/8, width*0.8, height/10);
		rules.display(
			height/50, width/2, height/3.3, width*0.8, height/3);
		instructions.display(
			height/50, width/2, height/2.15, width*0.8, height/10);
		scoring.display(
			height/50, width/2, height/1.7, width*0.8, height/5);
		levels.display(
			height/50, width/2, height/1.4, width*0.8, height/10);
		playButton.display(
			height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(
			height/30, width/4, height/1.2, width*0.35, height/10);
	}
}