class MainGamePage{
	TextBox station, score, scoreNumber, timer, timerClock;
	Button closeDoors;
	int[][] trainGrid;
	String stationName = "Shawnessy";
	int startTime;
	int timeRemaining = 120;

	MainGamePage(){
		station = new TextBox(stationName);
		score = new TextBox("Score");
		scoreNumber = new TextBox("0");
		timer = new TextBox("Timer");
		timerClock = new TextBox("0");
		closeDoors = new Button("Closing Doors", States.TRANSITION_PAGE);
	}

	void display(){
		station.displayBox(height/20, width/4, height/20, width/5, height/14);
		closeDoors.display(height/30, width/4, height/7, width/6, height/15);

		score.displayBox(height/20, width*3/5, height/20, width/7, height/14);
		scoreNumber.displayBox(height/20, width*3/5, height/7, width/7, height/10);

		timer.displayBox(height/20, width*4/5, height/20, width/7, height/14);
		timerClock.displayBox(height/20, width*4/5, height/7, width/7, height/10);
		timerClock.setText(str(timer()));

		rectMode(CENTER);
		for (int x=1; x<17; x++) {
			//println(x);
	    	for (int y=3; y<9; y++) {
	      		if(((x > 2 && x < 8) || (x > 9 && x < 15)) && ((y >= 3 && y < 5) || (y > 6 && y <=9))){
	      			fill(navyBlue);
	      		}
	      		else{
	      			fill(darkGray);
	      		}
	      		rect (x*width/17, y*height/12, width/17, height/12);
	    	}
	  	}

	  	for(int x=1; x<17; x++){
	  		for(int y=9; y < 12; y++){
	  			fill(white);
	      		rect(x*width/17, y*height/12, width/17, height/12);
	  		}
	  	}
	}

	int timer(){
		return timeRemaining + (startTime - millis())/1000;
	}	

	void setStartTime(int start){
		startTime = start;
	}
}