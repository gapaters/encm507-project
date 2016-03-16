class LevelSelectionPage
{
	TextBox title;
	RadioButtons levelDifficulty;
	Button playButton, menuButton;

  	LevelSelectionPage()
	{
		title = new TextBox("Level Selection");
		
		String[] levelNames = { "Easy", "Medium", "Hard" };
		States[] states = { States.MAIN_GAME, States.MAIN_GAME, States.MAIN_GAME };
		levelDifficulty = new RadioButtons(levelNames, states);
		
		playButton = new Button("Play", States.MAIN_GAME);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		levelDifficulty.display(height/30, width/2, height/3.5, width*0.25, height/10);
		
		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}