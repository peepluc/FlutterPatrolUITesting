import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_patrol_ui_testing/quizUtil/quiz_cubit.dart';
import 'package:flutter_patrol_ui_testing/quizUtil/quiz_state.dart';
import 'package:flutter_patrol_ui_testing/quiz_screen.dart';

void main() => runApp(PatrolQuizApp());

class PatrolQuizApp extends StatelessWidget {
  const PatrolQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => QuizCubit()..init(),
        child: QuizScreen(),
      ),
    );
  }
}