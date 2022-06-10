class Anwser { 
  int valueYes = #03FF00; 
  int valueNo = #FF0004; 

  void Display() { 
    stroke(0); 
    strokeWeight(5); 

    //yes 
    fill(valueYes); 
    rect(width/8, height/8*5, width/4, height/4);

    // no 
    fill(valueNo); 
    rect(width/8*5, height/8*5, width/4, height/4);
  } 

  void mouseClicked() { 
    if (mouseX > width/8 && mouseY > height/8*5 && mouseX < width/8*3 && mouseY < height/8*7) { 
      valueYes = #FCF508;
    } else { 
      valueYes = #03FF00;
    } 

    if (mouseX > width/8*5 && mouseY > height/8*5 && mouseX < width/8*7 && mouseY < height/8*7) { 
      valueNo = #FCF508;
    } else { 
      valueNo = #FF0004;
    }
  }
} 
