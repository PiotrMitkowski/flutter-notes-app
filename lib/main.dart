import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/data/repository.dart';
import 'package:flutter_notes_app/home/view/home_screen.dart';
import 'package:flutter_notes_app/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return RepositoryProvider.value(
      value: notesRepository,
      child: MaterialApp(
        title: 'Notes app',
        theme: appTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
