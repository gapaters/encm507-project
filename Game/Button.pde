class Button
{
	//float coordX, coordY, buttonWidth, buttonHeight;
	String buttonLabel;
	TextBox buttonText;
	Button(String label)
	{
		rectMode(CENTER);
		buttonLabel = label;
		buttonText = new TextBox(buttonLabel);
	}

	void display(float textSize, float coordX, float coordY, float buttonWidth, float buttonHeight)
	{
		fill(white);
		stroke(black);
		rect(coordX, coordY, buttonWidth, buttonHeight);
		buttonText.display(textSize, coordX, coordY);
	}
}