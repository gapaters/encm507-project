// Class used to display elements on the level transitions page

class TransitionPage
{
	TextBox title, scoreBreakdown;
	Button nextStation;
	int timeBonus = 0;

  	TransitionPage()
	{
		title = new TextBox("Leaving station");
		
		scoreBreakdown = new TextBox(
			"Score Breakdown\nStation 1: " + mainGamePage.scoreStation1() + 
			"\nStation 2: " + mainGamePage.scoreStation2() + 
			"\nStation 3: " + mainGamePage.scoreStation3() + 
			"\nStation 4: " + mainGamePage.scoreStation4());

		nextStation = new Button("Go to next station", States.MAIN_GAME);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		
		scoreBreakdown.displayBox(height/25, width/2, height/3, width*0.35, height/2.7);
		scoreBreakdown.setText(
			"Score Breakdown\nStation 1: " + mainGamePage.scoreStation1() + 
			"\nStation 2: " + calculateScore(mainGamePage.scoreStation2(), mainGamePage.scoreStation1()) + 
			"\nStation 3: " + calculateScore(mainGamePage.scoreStation3(), mainGamePage.scoreStation2()) + 
			"\nStation 4: " + calculateScore(mainGamePage.scoreStation4(), mainGamePage.scoreStation3()) +
			"\nStation time bonus : " + timeBonus);

		nextStation.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
	}

	int calculateScore(int thisStation, int previousStation){
		if(thisStation != 0){
			return thisStation - previousStation;
		}
		return 0;
	}

	void setTimeBonus(int bonus){
		timeBonus = bonus;
		scoring.addBonus(bonus);
	}
}