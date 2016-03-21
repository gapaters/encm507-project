class GameCompletionPage
{
	TextBox title, scoreBreakdownTitle;
	Button playButton, menuButton;

  	GameCompletionPage()
	{
		title = new TextBox("Game Finished!");
		
		scoreBreakdownTitle = new TextBox("Score Breakdown");

		playButton = new Button("Play Again!", States.LEVEL_SELECTION);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdownTitle.display(height/30, width/2, height/12);

		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}