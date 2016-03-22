class GameCompletionPage
{
	TextBox title, scoreBreakdown;
	Button playButton, menuButton;
	MainGamePage mainGame_;

  	GameCompletionPage(MainGamePage mainGame)
	{
		mainGame_ = mainGame;
		title = new TextBox("Game Finished!");
		
		scoreBreakdown = new TextBox(
			"Score Breakdown\nStation 1: " + mainGame_.scoreStation1() + 
			"\nStation 2: " + mainGame_.scoreStation2() + 
			"\nStation 3: " + mainGame_.scoreStation3() + 
			"\nStation 4: " + mainGame_.scoreStation4());

		playButton = new Button("Play Again!", States.LEVEL_SELECTION);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdown.display(height/30, width/2, height/2);

		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}