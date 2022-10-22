import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/view/add_note_screen.dart';
import 'package:flutter_notes_app/data/repository.dart';
import 'package:flutter_notes_app/home/bloc/notes_list_bloc.dart';
import 'package:flutter_notes_app/home/widgets/notes_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesListBloc(
        context.read<NotesRepository>(),
      )..add(NotesListRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddNoteScreen.route());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<NotesListBloc, NotesListState>(
          builder: (context, state) => ListView.separated(
            itemCount: state.notes.length,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              thickness: 2,
            ),
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return NotesListItem(note: note);
            },
          ),
        ),
      ),
    );
  }
}
