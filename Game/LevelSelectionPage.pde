class LevelSelectionPage
{
	TextBox title, easy, medium, hard;
	Button playButton, menuButton;

  	LevelSelectionPage()
	{
		title = new TextBox("Level Selection");
		
		easy = new TextBox("Easy");
		medium = new TextBox("Medium");
		hard = new TextBox("Hard");
		
		playButton = new Button("Play", States.MAIN_GAME);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		easy.display(height/25, width/2, height/2.9, width*0.8, height/10);
		medium.display(height/25, width/2, height/2, width*0.8, height/10);
		hard.display(height/25, width/2, height/1.5, width*0.8, height/10);

		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}