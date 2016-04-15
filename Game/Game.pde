// libraries for audio player
import ddf.minim.*;
AudioPlayer player;
Minim minim;

// other global variables
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
float gridWidth, gridHeight;
static int difficulty = 1;
int fare = 4;
static int passengerId = 1;
Scoring scoring = new Scoring();
PassengerList passengerList = new PassengerList();

void setup()
{
  size(800, 600);
  gridWidth = width/18;
  gridHeight = height/13;

  // setup all the menu pages
  titlePage = new TitlePage();
  instructionsPage = new InstructionsPage();
  mainGamePage = new MainGamePage();
  levelSelectionPage = new LevelSelectionPage(mainGamePage);
  transitionPage = new TransitionPage(mainGamePage);
  gameCompletionPage = new GameCompletionPage(mainGamePage);

  // setup files to be loaded and played
  background = loadImage("media/ctrainBackground.jpg");
  minim = new Minim(this);
  player = minim.loadFile("media/rideOfTheValkyries.mp3", 2048);
  player.loop();
}

// loop to display different menus based on game state
void draw()
{
	background(black);
  image(background, 0, 0); 
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

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}