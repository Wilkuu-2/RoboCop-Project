
interface Displayable{
  static PVector size = new PVector(0,0); 
  void display();

}

/*
 INTERACTION TAB
 In this tab all the interactions with the outside world
 */

interface Interactible {
  //Enter your code that should happen when the START button is clicked
  void startPressed(boolean isOn);

  //Enter your code that should happen when the YES button is clicked
  void yesPressed();

  //Enter your code that should happen when the NO button is clicked
  void noPressed();
}


class DummyInteractible implements Interactible{
  int dummyVal = 1;
  void startPressed(boolean isOn){ println("[DUMMY]");}
  void noPressed(){println("[DUMMY]");}
  void yesPressed(){println("[DUMMY]");}
}
