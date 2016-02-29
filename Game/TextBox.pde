class TextBox
{
	//float textSize, coordX, coordY;
	String textLabel;
	TextBox(String text)
	{
		textLabel = text;
	}

	void display(float textSize, float coordX, float coordY)
	{
		textSize(textSize);
	  	textAlign(CENTER, CENTER); 
	  	fill(black);
	  	text(textLabel,coordX,coordY);
	}
}