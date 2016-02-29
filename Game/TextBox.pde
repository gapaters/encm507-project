class TextBox
{
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

	void display(float textSize, float coordX, float coordY, float textWidth, float textHeight)
	{
		textSize(textSize);
	  	textAlign(CENTER, CENTER); 
	  	fill(black);
	  	text(textLabel, coordX, coordY, textWidth, textHeight);
	}
}