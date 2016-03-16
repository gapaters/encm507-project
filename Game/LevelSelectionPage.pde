class LevelSelectionPage
{
	TextBox title;
	// String[] levelNames;
	// States[] difficulties;
	RadioButtons levelDifficulty;
	Button playButton, menuButton;

  	LevelSelectionPage()
	{
		title = new TextBox("Level Selection");
		
		String[] levelNames = { "Easy", "Medium", "Hard" };
		States[] difficulties = { States.MAIN_GAME_EASY, States.MAIN_GAME_MEDIUM, States.MAIN_GAME_HARD };
		levelDifficulty = new RadioButtons(levelNames, difficulties);
		
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		levelDifficulty.display(height/30, width/2, height/3.5, width*0.25, height/10);
		menuButton.display(height/30, width/2, height/1.2, width*0.35, height/10);
	}
}