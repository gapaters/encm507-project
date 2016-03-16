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

	void displayBox(float textSize, float coordX, float coordY, float boxWidth, float boxHeight){
		rectMode(CENTER);
		stroke(black);
		fill(white);
		rect(coordX, coordY, boxWidth, boxHeight);
		this.display(textSize, coordX, coordY);
	}

	void setText(String text)
	{
		textLabel = text;
	}
}