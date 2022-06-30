

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
      setQuestion(remove(round(random(0, size() -1))));
      used ++;
    }
    catch(IndexOutOfBoundsException e) {
      resolveTarget(end);
    }
  }
}
