class TitlePage{
TextBox title;
Button playButton;

TitlePage()
{
	title = new TextBox("Caught up in the C-Train!");
	playButton = new Button("Play");
}

void display()
{
	title.display(height/30, width/2, height/20);
	playButton.display(width/2, height/5, width*0.8, height/10);
}

}