
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_patrol_ui_testing/quizUtil/quiz_cubit.dart';
import 'package:flutter_patrol_ui_testing/quizUtil/quiz_state.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  final ConfettiController _controllerTopCenter = ConfettiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return SafeArea(
            child: (!state.isFinalResults!)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)),
                              child: LinearProgressIndicator(
                                  minHeight: 30,
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(30),
                                  value: state.progress!),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 2),
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 30),
                              child: questionSection(
                                  context, state, _controllerTopCenter),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : (state.correctAnswers! == state.questionModels!.length)
                    ? Stack(children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: ConfettiWidget(
                            numberOfParticles: 50,
                            confettiController: _controllerTopCenter,
                            blastDirectionality: BlastDirectionality.explosive,
                            // don't specify a direction, blast randomly
                            shouldLoop: false,

                            // start again as soon as the animation is finished
                            colors: const [
                              Colors.green,
                              Colors.blue,
                              Colors.pink,
                              Colors.orange,
                              Colors.purple
                            ],
                            child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/mr_fantastic_win.png',key: const Key('fantastic_win'),),
                                    Text(
                                      'CONGRATULATIONS \nYou are the best version of your self ! \n\nYour Score : ${state.correctAnswers!}/${state.questionModels!.length}',
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )), // manually specify the colors to be used
                            // define a custom shape/path.
                          ),
                        ),
                      ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Center(
                            child: Column(
                              children: [
                                Image.asset('assets/images/mr_fantastic_lose.png',key: const Key('fantastic_lose'),),

                                const Text(
                                  "Non hai superato il test, so che puoi far meglio.\nFatti sotto!",
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.w800),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30,),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'RIPROVA',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
          );
        },
      ),
    );
  }
}

Widget questionSection(BuildContext context, QuizState state,
    ConfettiController controllerTopCenter) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(state.questionModels!.elementAt(state.questionIndx!).question,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center),
     const  SizedBox(
        height: 30,
      ),
      for (String item
          in state.questionModels!.elementAt(state.questionIndx!).answers)
        Card(
            color: (state.userTap!)
                ? (item == state.tapOnAnswer)
                    ? (item ==
                            state.questionModels!
                                .elementAt(state.questionIndx!)
                                .correct)
                        ? const Color.fromRGBO(66, 245, 99, 0.5)
                        : const Color.fromRGBO(245, 75, 66, 0.5)
                    : (item ==
                            state.questionModels!
                                .elementAt(state.questionIndx!)
                                .correct)
                        ? const Color.fromRGBO(66, 245, 99, 0.5)
                        : null
                : (state.showHint! && item ==
                state.questionModels!
                    .elementAt(state.questionIndx!)
                    .correct) ? Colors.amberAccent : null,
            borderOnForeground: true,
            elevation: 1,
            child: GestureDetector(
              onTap: () => context.read<QuizCubit>().getSm(item),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        if(state.showHint! && item ==
                            state.questionModels!
                                .elementAt(state.questionIndx!)
                                .correct) Flexible(child: Image.asset('assets/images/target.png', width: 30,color: Colors.red,)),
                        (state.userTap!)
                            ? (item == state.tapOnAnswer)
                                ? (item ==
                                        state.questionModels!
                                            .elementAt(state.questionIndx!)
                                            .correct)
                                    ? const Icon(
                                        Icons.check_box,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                : (item ==
                                        state.questionModels!
                                            .elementAt(state.questionIndx!)
                                            .correct)
                                    ? const Icon(
                                        Icons.check_box,
                                        color: Colors.white,
                                      )
                                    : const SizedBox()
                            : const SizedBox(),
                      ]),
                ),
              ),
            )),
      const SizedBox(height: 20),
      Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            key: const Key('hintIcon'),
            onPressed: () {
              context.read<QuizCubit>().shoHint();
              controllerTopCenter.play();
            },
            icon:  Icon(
              Icons.lightbulb,
              size: 35,
              color: (state.tapped!) ? Colors.blue : Colors.grey ,
            ),
          ),
          (state.userTap!)
              ? IconButton(
                  key: const Key('goForwardButton'),
                  onPressed: () {
                    context.read<QuizCubit>().goForward();
                    controllerTopCenter.play();
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ),
                )
              : const SizedBox(
                  height: 35,
                )
        ],
      )
    ],
  );
}
