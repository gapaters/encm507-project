class LevelSelectionPage
{
	TextBox title;
	Button playButton, menuButton;

  LevelSelectionPage()
	{
		title = new TextBox("Level Selection");
		
		playButton = new Button("Play", States.MAIN_GAME);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}