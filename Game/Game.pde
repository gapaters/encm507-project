int white = #FFFFFF;
int black = #000000;
int lightGray = #D3D3D3;
int darkGray = #A9A9A9;
int navyBlue = #000080;
TitlePage titlePage;
InstructionsPage instructionsPage;
LevelSelectionPage levelSelectionPage;
MainGamePage mainGamePage;
TransitionPage transitionPage;
GameCompletionPage gameCompletionPage;
States gameState = States.TITLE_PAGE;
PImage background;
String[] stations = new String[4];

void setup()
{
  size(864, 574);
  surface.setResizable(true);
  titlePage = new TitlePage();
  levelSelectionPage = new LevelSelectionPage();
  instructionsPage = new InstructionsPage();
  mainGamePage = new MainGamePage();
  transitionPage = new TransitionPage(mainGamePage);
  gameCompletionPage = new GameCompletionPage(mainGamePage);

  background = loadImage("media/ctrainBackground.jpg");
}

void draw()
{
	background(black);
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
  	break;	
  	case MAIN_GAME :
  		mainGamePage.display();
  	break;	
  	case TRANSITION_PAGE :
      transitionPage.display();
  	break;
  	case GAME_COMPLETION :
      gameCompletionPage.display();
  	break;	
  	case EXIT :
      exit();	
  	break;	
  }
}