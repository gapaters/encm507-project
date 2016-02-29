class TitlePage{
TextBox title;
TextBox names;
Button playButton;
Button instructionsButton;
Button exitButton;

TitlePage()
{
	title = new TextBox("Caught up in the C-Train!");
	names = new TextBox("By Gareth Paterson and Aaron Lai");
	playButton = new Button("Play");
	instructionsButton = new Button("Instructions");
	exitButton = new Button("Exit");
}

void display()
{
	title.display(height/20, width/2, height/10);
	playButton.display(height/30, width/2, height/3.6, width/4, height/10);
	instructionsButton.display(height/30, width/2, height/2, width/4, height/10);
	exitButton.display(height/30, width/2, height/1.4, width/4, height/10);
	names.display(height/40, width/1.2, height/1.05);
}

}