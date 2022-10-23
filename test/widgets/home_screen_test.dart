import 'package:flutter/material.dart';
import 'package:flutter_notes_app/data/repository.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';
import 'package:flutter_notes_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Correctly loads home screen without notes', (tester) async {
    final notesRepository = NotesRepository();
    await tester.pumpWidget(
      MyApp(
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
