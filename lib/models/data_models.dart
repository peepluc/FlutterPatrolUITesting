import 'package:flutter_patrol_ui_testing/models/qna_model.dart';

List<QAModel> models = [
  QAModel(
      answers: ['Italia', 'Grecia', 'Spagna', 'Turchia'],
      diff: Difficulty.easy,
      question: 'Di quale paese Roma è la capitale ? ',
      correct: 'Italia'),
  QAModel(
      answers: ['Polenta', 'Cornetto', 'Pizza', 'Pollo'],
      diff: Difficulty.easy,
      question: 'Quale piatto ha reso famosa Napoli nel campo culinario ? ',
      correct: 'Pizza'),
  QAModel(
      answers: ['Python', 'Dart', 'Java', 'C++'],
      diff: Difficulty.easy,
      question: 'Su che linguaggio Flutter è basato ? ',
      correct: 'Dart'),
];
