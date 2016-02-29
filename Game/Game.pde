int white = #FFFFFF;
int black = #000000;
TitlePage titlePage;
States gameState = States.TITLE_PAGE;

void setup()
{
  size(600, 400);
  surface.setResizable(true);
  titlePage = new TitlePage();
}

void draw()
{
  background(white);
  switch (gameState) {
  	case TITLE_PAGE :
  		titlePage.display();
  	break;	
  }
}