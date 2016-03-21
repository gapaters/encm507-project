class LevelSelectionPage
{
	TextBox title;
	RadioButtons levelDifficulty;
	Button playButton, menuButton;
	String[] easyStations = {"Tuscany", "Dalhousie", "Brentwood", "University of Calgary"};
	String[] mediumStations = {"Canyon Meadows", "Fish Creek - Lacombe", "Shawnessy", "Somerset - Bridlewood"};
	String[] hardStations = {"8th Street", "6th Street", "3rd Street", "Center Street"};

  	LevelSelectionPage()
	{
		title = new TextBox("Level Selection");
		
		String[] levelNames = { "Easy", "Medium", "Hard" };
		States[] states = { States.EASY, States.MEDIUM, States.HARD };
		levelDifficulty = new RadioButtons(levelNames, states);
		
		playButton = new Button("Play", States.MAIN_GAME);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		levelDifficulty.display(height/30, width/2, height/3.5, width*0.25, height/10);
		update();

		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}

	void update(){
		if(levelDifficulty.getDifficulty() != null){
			switch (levelDifficulty.getDifficulty()) {
				case EASY :
					stations = easyStations;
				break;
				case MEDIUM :
					stations = mediumStations;
				break;	
				case HARD :
					stations = hardStations;
				break;	
			}
		}
	}
}