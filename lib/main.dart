import 'package:flutter/material.dart';
import 'package:flutter_notes_app/app/app.dart';
import 'package:flutter_notes_app/data/data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notesRepository = LocalNotesRepository();

  runApp(
    App(notesRepository: notesRepository),
  );
}
