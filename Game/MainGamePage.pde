class MainGamePage{
	TextBox station, score, scoreNumber, timer, timerClock;
	Button closeDoors;
	int[][] trainGrid;
	String stationName = "Shawnessy";

	MainGamePage(){
		station = new TextBox(stationName);
		score = new TextBox("Score");
		scoreNumber = new TextBox("0");
		timer = new TextBox("Timer");
		timerClock = new TextBox("2:00");
		closeDoors = new Button("Closing Doors", States.TRANSITION_PAGE);
	}

	void display(){
		station.displayBox(height/20, width/4, height/20, width/5, height/14);

		score.displayBox(height/20, width*3/5, height/20, width/7, height/14);
		scoreNumber.displayBox(height/20, width*3/5, height/7, width/7, height/10);

		timer.displayBox(height/20, width*4/5, height/20, width/7, height/14);
		timerClock.displayBox(height/20, width*4/5, height/7, width/7, height/10);

		closeDoors.display(height/30, width*9/10, height/1.05, width/6, height/15);

		rectMode(CENTER);
		for (int x=1; x<15; x++) {
			//println(x);
	    	for (int y=3; y<9; y++) {
	      		if(((x > 1 && x < 7) || (x > 8 && x < 14)) && ((y >= 3 && y < 5) || (y > 6 && y <=9))){
	      			fill(navyBlue);
	      		}
	      		else{
	      			fill(darkGray);
	      		}
	      		rect (x*width/15, y*height/9.5, width/15, height/9.5);
	    	}
	  	}
	}	
}