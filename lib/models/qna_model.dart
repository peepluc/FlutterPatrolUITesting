enum Difficulty{
  easy,
  medium,
  hard,
  challenger
}

class QAModel {

  /// we assume that the first answer is the correct one,
  /// then we will shuffle them and send to the user
  final List<String> answers;
  final String correct;
  final String question;
  final Difficulty diff;

  QAModel({required this.answers, required this.diff,required this.question, required this.correct});



}