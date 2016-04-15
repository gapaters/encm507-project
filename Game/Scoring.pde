// Class to handle scoring algorithms

class Scoring{
	int score = 0;
	int adjacency = 3;
	int area = 0;
	int bonus = 0;

	Scoring(){

	}

	int calculateFare()
	{
		// First check the number of passengers on the train
		for(int i = 0; i < passengerList.length(); i++){
			if(passengerList.at(i).isOnTheTrain()){
				score += fare;
				println("Fare score");
			}
		}

		// Next check if passengers are adjacent to same colored passengers
		Passenger compare = passengerList.at(0);
		println("length is " + passengerList.length());
		for(int i = 0; i < passengerList.length(); i++){
			compare = passengerList.at(i);
			for(int j = 1; j < passengerList.length(); j++){
				//println(i);
				
				if(i == j)
				{
					if(j == passengerList.length() - 1)
					{
						break;
					}
					j++;
				}

				if( compare.isOnTheTrain() && passengerList.at(j).isOnTheTrain() &&
					((passengerList.at(j).bx == (compare.bx + compare.shapeWidth) && 
						verticalCheck(passengerList.at(j), compare)||
					(passengerList.at(j).by == (compare.by + compare.shapeHeight) &&
						horizontalCheck(passengerList.at(j), compare)))) &&
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



		int fareScore = score;
		score = 0;
		return fareScore;
	}

	// Calculate the amount of empty space on the train (at the end of the game)
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

	// Add time bonuses
	void addBonus(int time){
		bonus += time;
	}

	// Get for total time bonuses
	int getBonus(){
		return bonus;
	}

	// Used to check adjacency on a vertical basis
	boolean verticalCheck(Passenger atList, Passenger compare){
		return ((atList.by >= compare.by && atList.by <= compare.by + compare.shapeHeight)
			|| (compare.by >= atList.by && compare.by <= atList.by + atList.shapeHeight));
	}

	// Used to check adjacency on a horizontal basis
	boolean horizontalCheck(Passenger atList, Passenger compare){
		return ((atList.bx >= compare.bx && atList.bx <= compare.bx + compare.shapeWidth)
			|| (compare.bx >= atList.bx && compare.bx <= atList.bx + atList.shapeWidth));
	}
} 