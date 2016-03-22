class TransitionPage
{
	TextBox title, scoreBreakdown;
	Button nextStation;
	MainGamePage mainGame_;

  	TransitionPage(MainGamePage mainGame)
	{
		mainGame_ = mainGame;
		title = new TextBox("Leaving station");
		
		scoreBreakdown = new TextBox(
			"Score Breakdown\nStation 1: " + mainGame_.scoreStation1() + 
			"\nStation 2: " + mainGame_.scoreStation2() + 
			"\nStation 3: " + mainGame_.scoreStation3() + 
			"\nStation 4: " + mainGame_.scoreStation4());

		nextStation = new Button("Go to next station", States.MAIN_GAME);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdown.displayBox(height/25, width/2, height/3, width*0.35, height/3);

		nextStation.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
	}
}