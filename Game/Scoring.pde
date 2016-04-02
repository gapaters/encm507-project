class Scoring{
	int score = 0;
	int adjacency = 3;
	int area = 0;

	Scoring(){

	}

	int calculateFare(){
		for(int i = 0; i < mainGamePage.passengerList.length; i++){
			if(mainGamePage.passengerList[i].isOnTheTrain()){
				score += fare;
				println("Fare score");
			}
		}

		Passenger compare = mainGamePage.passengerList[0];
		println("length is " + mainGamePage.passengerList.length);
		for(int i = 0; i < mainGamePage.passengerList.length-1; i++){
			compare = mainGamePage.passengerList[i];
			for(int j = 1; j < mainGamePage.passengerList.length-1; j++){
				//println(i);
				if(i == j){
					j++;
				}
				if( compare.isOnTheTrain() && mainGamePage.passengerList[j].isOnTheTrain() &&
					((mainGamePage.passengerList[j].bx == (compare.bx + compare.shapeWidth) ||
					(mainGamePage.passengerList[j].by == (compare.by + compare.shapeHeight)))) &&
					(compare.passengerColor == mainGamePage.passengerList[j].passengerColor)){
					println("list x: " + mainGamePage.passengerList[j].bx);
					println("list x + width: " + (mainGamePage.passengerList[j].bx + mainGamePage.passengerList[j].shapeWidth));
					println("compare x: " + compare.bx);
					println("compare x + width: " + (compare.bx + compare.shapeWidth));
					//&& (mainGamePage.passengerList[i].passengerColor == (compare.bx + compare.passengerColor))){
					score += adjacency;
				}
				
			}
		}



		int fairScore = score;
		score = 0;
		return fairScore;
	}

	int calculateEmptySpace(){
		for(int i = 0; i < mainGamePage.passengerList.length; i++){
			if(mainGamePage.passengerList[i].isOnTheTrain()){
				area += (mainGamePage.passengerList[i].lineHeight * mainGamePage.passengerList[i].lineWidth);
			}
		}

		return ((16 * 6) - area);
	}
} 