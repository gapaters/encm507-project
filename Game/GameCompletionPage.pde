// Class used to display elements on the completion page

class GameCompletionPage
{
	TextBox title, scoreBreakdown;
	Button playButton, menuButton;
	int emptyModifier = 0;

  	GameCompletionPage()
	{
		title = new TextBox("Game Finished!");
		
		scoreBreakdown = new TextBox(
			"Score Breakdown\nStation 1: " + mainGamePage.scoreStation1() + 
			"\nStation 2: " + mainGamePage.scoreStation2() + 
			"\nStation 3: " + mainGamePage.scoreStation3() + 
			"\nStation 4: " + mainGamePage.scoreStation4() +
			"\nEmpty Space " + emptyModifier + 
			"\nTotal Score " + (mainGamePage.scoreStation4() - emptyModifier));

		playButton = new Button("Play Again!", States.LEVEL_SELECTION);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdown.display(height/30, width/2, height/2);
		scoreBreakdown.setText(
			"Score Breakdown\nStation 1: " + mainGamePage.scoreStation1() + 
			"\nStation 2: " + (mainGamePage.scoreStation2() - mainGamePage.scoreStation1()) + 
			"\nStation 3: " + (mainGamePage.scoreStation3() - mainGamePage.scoreStation2())+ 
			"\nStation 4: " + (mainGamePage.scoreStation4() - mainGamePage.scoreStation3())+
			"\nEmpty Space " + emptyModifier + 
			"\nTotal Time Bonus: " + scoring.getBonus() + 
			"\nTotal Score " + (mainGamePage.scoreStation4() - emptyModifier + scoring.getBonus()));


		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
		passengerList.deletePassengers();
	}
}