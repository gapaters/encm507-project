class InstructionsPage
{
	TextBox title, rules, instructions, scoring, levels;
	Button playButton, menuButton;
	InstructionsPage()
	{
		title = new TextBox("Instructions");
		rules = new TextBox("Rules\n<Insert rules here>");
		instructions = new TextBox("How to Play\nUsing your mouse, select a passenger to move. Then, click the upper right location on the grid where you want it to go next!");
		scoring = new TextBox("Scoring Mechanism\nScores will be awarded for: - Getting as many passengers on the train - Reducing as much empty space on the train - Placing similar colored passengers beside each other");
		levels = new TextBox("Level Differences\nMore difficult levels will include busier stations, and thus more people getting on at each station");
		playButton = new Button("Play", States.LEVEL_SELECTION);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		rules.display(height/50, width/2, height/5, width*0.8, height/5);
		instructions.display(height/50, width/2, height/2.9, width*0.8, height/10);
		scoring.display(height/50, width/2, height/2, width*0.8, height/10);
		levels.display(height/50, width/2, height/1.5, width*0.8, height/10);
		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}