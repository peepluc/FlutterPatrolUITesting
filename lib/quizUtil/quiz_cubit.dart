import 'package:confetti/confetti.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_patrol_ui_testing/models/qna_model.dart';
import 'package:flutter_patrol_ui_testing/quizUtil/quiz_state.dart';
import '../models/data_models.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState());


  void init() async {
    emit(state.copyWith(
        questionModels: models, questionIndx: 0, userTap: false, showHint: false));
  }

  void getSm(String model) {
    emit(state.copyWith(userTap: true, tapOnAnswer: model));
    if (model ==
        state.questionModels!
            .elementAt(state.questionIndx!)
            .correct){
      emit(state.copyWith(correctAnswers: state.correctAnswers!+1));
    }
  }

  void goForward() {
    if (state.questionIndx! < state.questionModels!.length - 1) {
      emit(state.copyWith(
          questionIndx: state.questionIndx! + 1, userTap: false ,showHint: false, tapped: false));
      emit(state.copyWith(progress: state.questionIndx!/state.questionModels!.length  ,
          ));
    } else {
      goEndResult();
    }
  }

  void shoHint(){
    emit(state.copyWith(showHint:  true, tapped:  true));
  }

  void goEndResult() {
    emit(state.copyWith(isFinalResults: true));
  }
}
