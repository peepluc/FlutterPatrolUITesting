import 'package:flutter_patrol_ui_testing/models/qna_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  factory QuizState({
    List<QAModel>? questionModels,
    @Default(false) bool? userTap,
    @Default(false) bool? isFinalResults,
    @Default(0) int? correctAnswers,
    int? questionIndx,
    String? tapOnAnswer,
    @Default(0.0)double? progress,
    @Default(false) bool? showHint,
    @Default(false) bool? tapped,
  }) = _QuizState;
}
