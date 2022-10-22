import 'package:flutter/material.dart';
import 'package:flutter_notes_app/data/repository.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';

void main() async {
  final notesRepository = NotesRepository();
  await notesRepository.initialize();

  runApp(
    MyApp(notesRepository: notesRepository),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.notesRepository,
  });

  final NotesRepository notesRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
