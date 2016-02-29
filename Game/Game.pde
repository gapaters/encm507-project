int white = #FFFFFF;
int black = #000000;
TitlePage titlePage;

void setup()
{
  size(600, 400);
  surface.setResizable(true);
  titlePage = new TitlePage();
}

void draw()
{
  background(white);
  titlePage.display();
  
}