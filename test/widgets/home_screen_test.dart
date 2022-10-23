import 'package:flutter/material.dart';
import 'package:flutter_notes_app/app/app.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_notes_app/data/local_notes_repository.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Correctly loads home screen without notes', (tester) async {
    final notesRepository = LocalNotesRepository();
    await tester.pumpWidget(
      App(
        notesRepository: notesRepository,
      ),
    );
    await tester.pumpAndSettle();

    final homeScreenFinder = find.byType(HomeScreen);
    expect(homeScreenFinder, findsOneWidget);

    final noteBodyFinder = find.byKey(const Key('note_body'));
    expect(noteBodyFinder, findsNothing);
  });
}
