int white = #FFFFFF;
int black = #000000;
int lightGray = #D3D3D3;
TitlePage titlePage;
InstructionsPage instructionsPage;
LevelSelectionPage levelSelectionPage;
States gameState = States.TITLE_PAGE;
PImage background;

void setup()
{
  size(864, 574);
  surface.setResizable(true);
  titlePage = new TitlePage();
  levelSelectionPage = new LevelSelectionPage();
  instructionsPage = new InstructionsPage();
  background = loadImage("ctrainBackground.jpg");
}

void draw()
{
  image(background, 0, 0); 
  // cannot make it be background, since it complains when varying window size
  switch (gameState) {
  	case TITLE_PAGE :
  		titlePage.display();
  	break;	
  	case INSTRUCTIONS_PAGE :
  		instructionsPage.display();
  	break;	
  	case LEVEL_SELECTION :
      levelSelectionPage.display();
  		//println("Level selection");
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
      exit();	
  	break;	
  }
}