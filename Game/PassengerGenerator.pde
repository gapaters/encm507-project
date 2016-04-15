// Class used to generate different passengers

class PassengerGenerator
{
	PassengerGenerator()
	{
	}

	Passenger[] generate()
	{
		// number of passengers generated based on game difficulty
 	 	int numberToGenerate = 2*Game.difficulty + 4;
		Passenger[] passengerList = new Passenger[numberToGenerate];

		for (int i = 0; i < numberToGenerate; i++)
		{
			int passengerType = (int)(random(1, 10)); // generates numbers from 1 to 9, since it rarely generates a full 10, and usually gets chopped down to 9
			Passenger toAdd;
			  switch (passengerType) {
			  	case 1 :
			  		toAdd = new Passenger(1, 1, #FF0000); // 1x1 passenger
			  	break;	
			  	case 2 :
			  		toAdd = new Passenger(1, 1, #FF0000); // 1x1 passenger
			  	break;			  	
			  	case 3:
			  		toAdd = new Passenger(1, 1, #FF0000); // 1x1 passenger
			  	break;
			  	case 4 :
			  		toAdd = new Passenger(1, 1, #FF0000); // 1x1 passenger
			  	break;	
			  	case 5:
			  		toAdd = new Passenger(2, 1, #00FF00); // 2x1 passenger (passenger with bag)
			  	break;	
			  	case 6 :
			      	toAdd = new Passenger(1, 2, #00FF00); // 1x2 passenger (passenger with bag)
			  	break;	
			  	case 7 :
			  		toAdd = new Passenger(2, 2, #0000FF); // 2x2 passenger (wheelchair)
			  	break;	
			  	case 8 :
			      	toAdd = new Passenger(1, 3, #FFFF00); // 1x3 passenger (bike)
			  	break;
			  	case 9 :
			      	toAdd = new Passenger(3, 1, #FFFF00); // 3x1 passenger (bike)
			  	break;	
			  	default :
			      	toAdd = new Passenger(1, 1, #FF0000); // 1x1 passenger, default case should never happen
			  	break;	
			  }
			passengerList[i] = toAdd;
		}
		return passengerList;
	}
}