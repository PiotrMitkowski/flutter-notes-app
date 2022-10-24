import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notes_app/app/app.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  testWidgets('Correctly loads home screen without notes', (tester) async {
    final streamController = StreamController<List<Note>>();
    final notesRepository = MockNotesRepository();
    when(notesRepository.getNotes()).thenAnswer((_) => streamController.stream);
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

  testWidgets('Correctly loads home screen with a single note', (tester) async {
    final mockNote = Note()
      ..content = 'Test note'
      ..creationDate = DateTime.now();
    final streamController = StreamController<List<Note>>()..add([mockNote]);
    final notesRepository = MockNotesRepository();
    when(notesRepository.getNotes()).thenAnswer((_) => streamController.stream);
    await tester.pumpWidget(
      App(
        notesRepository: notesRepository,
      ),
    );
    await tester.pumpAndSettle();

    final homeScreenFinder = find.byType(HomeScreen);
    expect(homeScreenFinder, findsOneWidget);

    final noteBodyFinder = find.byKey(const Key('note_body'));
    expect(noteBodyFinder, findsOneWidget);
  });
}
