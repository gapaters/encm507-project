class PassengerList
{
	public Passenger[] passengerList;
	public PassengerGenerator generator;

	PassengerList()
	{

	}

	int length()
	{
		return passengerList.length;
	}

	Passenger at(int i)
	{
		return passengerList[i];
	}

	void addPassengers()
	{
		passengerList = concat(passengerList, generator.generate());
		setStartingLocationsInPassengerQueue();
	}

	void deletePassengers()
	{
		passengerList = null;
	}

	void hidePreviousPassengers()
	{
		for (int i = 0; i < passengerList.length; i++)
		{
			if(!passengerList[i].isOnTheTrain())
			{
				passengerList[i].hide = true;
			}
		}
	}

	void setStartingLocationsInPassengerQueue()
	{
		int xCounter = 1;
		int yCounter = 9;
		for (int i = 0; i < passengerList.length; i++)
		{
			if(!passengerList[i].hadInitialLocationSet)
			{
				passengerList[i].setStartingLocation(xCounter + gridWidth, yCounter * gridHeight);
				xCounter += passengerList[i].shapeWidth;
			}
		}
	}

	public Passenger[] concat(Passenger[] a, Passenger[] b) {
		if (a == null)
		{
			if (b == null)
			{
				return null;
			}
			return b;
		}

		if (b == null)
		{
			return a;
		}

   		int aLen = a.length;
   		int bLen = b.length;
   		Passenger[] c= new Passenger[aLen+bLen];
   		System.arraycopy(a, 0, c, 0, aLen);
   		System.arraycopy(b, 0, c, aLen, bLen);
   		return c;
	}
}