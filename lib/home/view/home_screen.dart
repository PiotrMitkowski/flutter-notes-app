import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/view/add_note_screen.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_notes_app/home/bloc/notes_list_bloc.dart';
import 'package:flutter_notes_app/home/widgets/notes_list_view.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesListBloc(
        context.read<NotesRepository>(),
      )..add(NotesListRequested()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final labels = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(labels.homeScreenTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddNoteScreen.route());
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotesListView(),
      ),
    );
  }
}
