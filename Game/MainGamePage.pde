class MainGamePage{
	TextBox station, score, scoreNumber, timer, timerClock;
	Button closeDoors;
	int[][] trainGrid = new int[16][6];
	String stationName;
	int startTime;
	int timeRemaining = 20;
	int transition = 0;
	int[] scoreStation = new int[4];

	MainGamePage(){
		station = new TextBox("");
		score = new TextBox("Score");
		scoreNumber = new TextBox("0");
		timer = new TextBox("Timer");
		timerClock = new TextBox("0");
		closeDoors = new Button("Closing Doors", States.TRANSITION_PAGE);
	}

	void display(){
		station.displayBox(height/20, width/4, height/20, width/2, height/14);
		station.setText(stations[transition]);
		closeDoors.display(height/30, width/4, height/7, width/5, height/15);

		score.displayBox(height/20, width*3/5, height/20, width/7, height/14);
		scoreNumber.displayBox(height/20, width*3/5, height/7, width/7, height/10);
		if((transition-1) >= 0){
			scoreNumber.setText(str(scoreStation[transition-1]));
		}
		

		timer.displayBox(height/20, width*4/5, height/20, width/7, height/14);
		timerClock.displayBox(height/20, width*4/5, height/7, width/7, height/10);
		timerClock.setText(str(timer()));

		rectMode(CORNER);
		for (int x=1; x<17; x++) {
			//println(x);
	    	for (int y=3; y<9; y++) {
	      		if(((x > 2 && x < 8) || (x > 9 && x < 15)) && ((y >= 3 && y < 5) || (y > 6 && y <=9))){
	      			fill(navyBlue);
	      			trainGrid[x-1][y-3] = navyBlue;
	      		}
	      		else{
	      			fill(darkGray);
	      			trainGrid[x-1][y-3] = darkGray;
	      		}
	      		rect (x*gridWidth, y*gridHeight, gridWidth, gridHeight);
	    	}
	  	}

	  	for(int x=1; x<17; x++){
	  		for(int y=9; y < 12; y++){
	  			fill(white);
	      		rect(x*gridWidth, y*gridHeight, gridWidth, gridHeight);
	  		}
	  	}
		passengerList.display();
	}

	int timer(){
		int time = timeRemaining + (startTime - millis())/1000;
		if(time <= 0){
			passengerList.hidePreviousPassengers();
			mainGamePage.scoreStation[mainGamePage.transition] = scoring.calculateFare();
			println("transition :" + mainGamePage.scoreStation[mainGamePage.transition]);
			for(int i = 0; i < passengerList.length(); i++){
				if(passengerList.at(i).isOnTheTrain()){
					passengerList.at(i).levelLocking();
				}
			}
			transitionPage.setTimeBonus(0);
			mainGamePage.transition();
			//println("transition");
			if(mainGamePage.isFinished())
			{
				//println("game complete");
				gameCompletionPage.emptyModifier = scoring.calculateEmptySpace();
				gameState = States.GAME_COMPLETION;
				//println(gameState);
			}
			else 
			{
				gameState = States.TRANSITION_PAGE;
			}
		}
		return time;
	}	

	void setStartTime(int start){
		startTime = start;
	}

	void transition(){
		transition++;
		println(transition);
	}

	boolean isFinished(){
		if(transition >= stations.length){
			transition = 0;
			return true;
		}
		return false;
	}

	int scoreStation1()
	{
		return scoreStation[0];
	}

	int scoreStation2()
	{
		return scoreStation[1];
	}

	int scoreStation3()
	{
		return scoreStation[2];
	}

	int scoreStation4()
	{
		return scoreStation[3];
	}

	void clearScore()
	{
		scoreStation[0] = 0;
		scoreStation[1] = 0;
		scoreStation[2] = 0;
		scoreStation[3] = 0;
	}

	void setTimeRemaining(int time){
		timeRemaining = time;
	}
}