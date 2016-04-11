class Scoring{
	int score = 0;
	int adjacency = 3;
	int area = 0;

	Scoring(){

	}

	int calculateFare(){
		for(int i = 0; i < passengerList.length(); i++){
			if(passengerList.at(i).isOnTheTrain()){
				score += fare;
				println("Fare score");
			}
		}

		Passenger compare = passengerList.at(0);
		println("length is " + passengerList.length());
		for(int i = 0; i < passengerList.length(); i++){
			compare = passengerList.at(i);
			for(int j = 1; j < passengerList.length(); j++){
				//println(i);
				
				if(i == j ){
					if(j == passengerList.length() -1){
					break;
					}
					j++;
				}
				if( compare.isOnTheTrain() && passengerList.at(j).isOnTheTrain() &&
					((passengerList.at(j).bx == (compare.bx + compare.shapeWidth) ||
					(passengerList.at(j).by == (compare.by + compare.shapeHeight)))) &&
					(compare.passengerColor == passengerList.at(j).passengerColor)){
					println("list x: " + passengerList.at(j).bx);
					println("list x + width: " + (passengerList.at(j).bx + passengerList.at(j).shapeWidth));
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
		for(int i = 0; i < passengerList.length(); i++){
			if(passengerList.at(i).isOnTheTrain()){
				area += (passengerList.at(i).lineHeight * passengerList.at(i).lineWidth);
			}
		}

		int temp = area;
		area = 0;
		return ((16 * 6) - temp);
	}
} 