int white = #FFFFFF;
int black = #000000;
int lightGray = #D3D3D3;
TitlePage titlePage;
InstructionsPage instructionsPage;
States gameState = States.TITLE_PAGE;

void setup()
{
  size(600, 400);
  surface.setResizable(true);
  titlePage = new TitlePage();
  instructionsPage = new InstructionsPage();
}

void draw()
{
  background(white);
  switch (gameState) {
  	case TITLE_PAGE :
  		titlePage.display();
  	break;	
  	case INSTRUCTIONS_PAGE :
  		instructionsPage.display();
  	break;	
  	case LEVEL_SELECTION :
  		println("Level selection");
  	break;	
  	case MAIN_GAME :
  		titlePage.display();
  		println("Main game page");
  	break;	
  	case TRANSITION_PAGE :
  		println("Transition page");
  	break;
  	case GAME_COMPLETION :
  		println("Game complete!");	
  	break;	
  	case EXIT :
  		titlePage.display();
  		println("Exiting program...");	
  	break;		
  }
}