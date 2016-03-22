class TransitionPage
{
	TextBox title, scoreBreakdown;
	Button nextStation;
	int score1 = 0, score2 = 0, score3 = 0, score4 = 0;

  	TransitionPage()
	{
		title = new TextBox("Game Finished!");
		
		scoreBreakdown = new TextBox(
			"Score Breakdown\nStation 1: " + score1 + 
			"\nStation 2: " + score2 + 
			"\nStation 3: " + score3 + 
			"\nStation 4: " + score4);

		nextStation = new Button("Arrived at next station", States.MAIN_GAME);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdown.displayBox(height/25, width/2, height/3, width*0.35, height/3);

		nextStation.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
	}
}