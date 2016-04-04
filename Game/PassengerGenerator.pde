class PassengerGenerator
{
	PassengerGenerator()
	{
	}

	Passenger[] generate()
	{
 	 	int numberToGenerate = 2*Game.difficulty + 4;
		Passenger[] passengerList = new Passenger[numberToGenerate];

		for (int i = 0; i < numberToGenerate; i++)
		{
			int passengerType = (int)(random(0, 10));
			Passenger toAdd;
			  switch (passengerType) {
			  	case 1 :
			  		toAdd = new Passenger(1, 1, #FF0000);
			  	break;	
			  	case 2 :
			  		toAdd = new Passenger(1, 1, #FF0000);
			  	break;			  	
			  	case 3:
			  		toAdd = new Passenger(1, 1, #FF0000);
			  	break;
			  	case 4 :
			  		toAdd = new Passenger(1, 1, #FF0000);
			  	break;	
			  	case 5:
			  		toAdd = new Passenger(2, 1, #00FF00);
			  	break;	
			  	case 6 :
			      	toAdd = new Passenger(1, 2, #00FF00);
			  	break;	
			  	case 7 :
			  		toAdd = new Passenger(2, 2, #0000FF);
			  	break;	
			  	case 8 :
			      	toAdd = new Passenger(1, 3, #FFFF00);
			  	break;
			  	case 9 :
			      	toAdd = new Passenger(3, 1, #FFFF00);
			  	break;	
			  	default :
			      	toAdd = new Passenger(1, 1, #FF0000);
			  	break;	
			  }
			passengerList[i] = toAdd;
		}
		return passengerList;
	}
}