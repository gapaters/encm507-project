class TransitionPage
{
	TextBox title, scoreBreakdownTitle;
	Button nextStation, endGame;

  	TransitionPage()
	{
		title = new TextBox("Game Finished!");
		
		scoreBreakdownTitle = new TextBox("Score Breakdown");

		nextStation = new Button("Next Station", States.MAIN_GAME);
		endGame = new Button("End game", States.GAME_COMPLETION);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdownTitle.display(height/30, width/2, height/12);

		nextStation.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		endGame.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}