import java.util.List;
import java.util.stream.Collectors;

class QuestionPool extends ArrayList<Question> {
  JSONObject poolObj;
  String name;
  String end;
  int used = 0;
  int max;

  QuestionPool(JSONObject obj) {
    super();

    name = obj.getString("name");
    end = obj.getString("end");

    try {
      max = obj.getInt("max");
    }
    catch(NullPointerException e) {
      max = 99;
    }

    System.out.printf("+-----------------------[POOL: %-12s]-----------------------+\n", name);
    System.out.printf("+-------[max: %02d]----------------------------[end: %-12s]---+\n", max, end);
    println("|--------name--------|---------yes->--------|----------no->--------|");

    var questionsArr = obj.getJSONArray("questions");
    for (int j = 0; j < questionsArr.size(); j++ ) {
      add(new Question(questionsArr.getJSONObject(j)));
    }
  }

  // Gets you a random question from the pool and removes it
  void useRandomOrEnd() {
    try {
      if (used >= max)
        throw new IndexOutOfBoundsException();
      
      ArrayList<Question> availQuestions = new ArrayList<Question>(
                                          stream()
                                          .filter(q -> !q.wasSelected)
                                          .collect(Collectors.toList()));
      if(availQuestions.size() < 1)
        throw new IndexOutOfBoundsException();

      setQuestion(availQuestions.remove(
                                   round(
                                     random(0, 
                                        availQuestions.size() -1))));
      currentQuestion.onPoolSwitchOn(name);
      used ++;
    }
    
    catch(IndexOutOfBoundsException e) {
      System.out.printf("[SWITCH][POOL] %s has been depleted.\n", name); 
      resolveTarget(end);
    }
  }
  void reset(){
    used = 0; 
    forEach(q -> q.wasSelected = false);
  }
}
