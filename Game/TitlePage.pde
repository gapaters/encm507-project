class TitlePage
{
TextBox title, names;
Button playButton, instructionsButton, exitButton;

TitlePage()
{
	title = new TextBox("Caught up in the C-Train!");
	names = new TextBox("By Gareth Paterson and Aaron Lai");
	playButton = new Button("Play", States.MAIN_GAME);
	instructionsButton = new Button("Instructions", States.INSTRUCTIONS_PAGE);
	exitButton = new Button("Exit", States.EXIT);
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