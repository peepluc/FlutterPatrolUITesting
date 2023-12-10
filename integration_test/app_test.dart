// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_patrol_ui_testing/mainQuiz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

import 'config.dart';

void main() {
  patrolTest('',
        ($) async {
      await $.pumpWidgetAndSettle(
          const PatrolQuizApp(),
      );

      /// ricerca tramite TESTO -> cerco il bottone
      /// che contiene il testo 'italia' e eseguo il tap
      // tap su italia

     // await $.tap(find.text('Italia'));
      await $('Italia').tap();
      await $.pump(const Duration(milliseconds: 400));

      /// ricerca tramite key -> cerco il bottone
      /// che ha quella Key ed eseguo il tap
      // avanti nel quiz
      //await $.tap(find.byKey(const Key('goForwardButton')));
      /// accesso diretto alle key e con tap
      await $(#goForwardButton).tap();
      await $.pump(const Duration(milliseconds: 400));

      /// ricerca tramite iconData -> cerco l'icona
      /// ed eseguo il tap
      // hint action
      await $(Icons.lightbulb).tap();
      await $.pump(const Duration(milliseconds: 400));
      //await $.tap(find.byIcon(Icons.lightbulb));

      /// ricerca tramite immagine -> cerco l'asset dell'immagine
      /// ed eseguo il tap
      // hint action
      await $.tap(find.image(const AssetImage('assets/images/target.png')));
      await $.pump(const Duration(milliseconds: 400));
      await $.tap(find.byKey(const Key('goForwardButton')));

      await $.tap(find.text('Dart'));
      await $.tap(find.byKey(const Key('goForwardButton')));


      expect($(#fantastic_win), findsOneWidget);
      
      /*
      /// lose case
      await $.tap(find.text('Python'));
      await $.tap(find.byKey(const Key('goForwardButton')));

      expect($(#fantastic_win), findsOneWidget);
*/

    },
    config: patrolConfig,
    nativeAutomatorConfig: nativeAutomatorConfig,
  );
}
