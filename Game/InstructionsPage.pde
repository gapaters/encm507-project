class InstructionsPage
{
	TextBox title, rules, instructions, scoring, levels;
	Button playButton, menuButton;
	InstructionsPage()
	{
		title = new TextBox("Instructions");
		rules = new TextBox("Rules\n<Insert rules here>");
		instructions = new TextBox("How to Play\n<Insert instructions here>");
		scoring = new TextBox("Scoring Mechanism\n<Insert scoring rules here>");
		levels = new TextBox("Level Differences\n<Insert level differences here>");
		playButton = new Button("Play", States.MAIN_GAME);
		menuButton = new Button("Return to Main Menu", States.TITLE_PAGE);
	}

	void display()
	{
		title.display(height/20, width/2, height/15);
		rules.display(height/50, width/2, height/5, width*0.8, height/5);
		instructions.display(height/50, width/2, height/2.9, width*0.8, height/10);
		scoring.display(height/50, width/2, height/2, width*0.8, height/10);
		levels.display(height/50, width/2, height/1.5, width*0.8, height/10);
		playButton.display(height/30, width*3/4, height/1.2, width*0.35, height/10);
		menuButton.display(height/30, width/4, height/1.2, width*0.35, height/10);
	}
}