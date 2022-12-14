import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_notes_app/app/app.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_note_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  testWidgets('Correctly adds note', (tester) async {
    final streamController = StreamController<List<Note>>();
    final notesRepository = MockNotesRepository();
    when(notesRepository.getNotes()).thenAnswer((_) => streamController.stream);
    when(notesRepository.saveNote(any)).thenAnswer((realInvocation) async {
      final addedNote = realInvocation.positionalArguments[0] as Note;
      streamController.add([addedNote]);
    });

    await tester.pumpWidget(
      App(
        notesRepository: notesRepository,
      ),
    );
    await tester.pumpAndSettle();

    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);
    await tester.tap(fabFinder);
    await tester.pumpAndSettle();

    final noteFieldFinder = find.byKey(const Key('note_text_field'));
    expect(noteFieldFinder, findsOneWidget);
    final saveButtonFinder = find.byKey(const Key('save_button'));
    expect(saveButtonFinder, findsOneWidget);
    await tester.enterText(noteFieldFinder, 'My text');
    await tester.tap(saveButtonFinder);
    await tester.pumpAndSettle();

    final noteBodyFinder = find.byKey(const Key('note_body'));
    expect(noteBodyFinder, findsOneWidget);
    final noteBody = tester.firstWidget(noteBodyFinder) as Text;
    expect(noteBody.data, equals('My text'));
  });
}
