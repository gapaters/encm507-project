class Scoring{
	int score = 0;
	int adjacency = 3;
	int area = 0;

	Scoring(){

	}

	int calculateFair(){
		for(int i = 0; i < mainGamePage.passengerList.length; i++){
			if(mainGamePage.passengerList[i].isInGrid()){
				score += fare;
				println("Fare score");
			}
		}

		/*Passenger compare = mainGamePage.passengerList[0];
		for(int i = 0; i < mainGamePage.passengerList.length; i++){
			if( compare.isInGrid() && mainGamePage.passengerList[i].isInGrid()){ //&&
				//(mainGamePage.passengerList[i].bx == (compare.bx + compare.shapeWidth))){
				println("list x: " + mainGamePage.passengerList[i].bx);
				println("list x + width: " + (mainGamePage.passengerList[i].bx + mainGamePage.passengerList[i].shapeWidth));
				println("compare x + width: " + (compare.bx + compare.shapeWidth));
				//&& (mainGamePage.passengerList[i].passengerColor == (compare.bx + compare.passengerColor))){
				score += adjacency;
			}
			compare = mainGamePage.passengerList[i];
		}*/



		int fairScore = score;
		score = 0;
		return fairScore;
	}

	int calculateEmptySpace(){
		for(int i = 0; i < mainGamePage.passengerList.length; i++){
			if(mainGamePage.passengerList[i].isInGrid()){
				area += (mainGamePage.passengerList[i].lineHeight * mainGamePage.passengerList[i].lineWidth);
			}
		}

		return ((16 * 6) - area);
	}
} 