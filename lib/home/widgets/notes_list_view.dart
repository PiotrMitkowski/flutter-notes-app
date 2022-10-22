import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/home/bloc/notes_list_bloc.dart';
import 'package:flutter_notes_app/home/widgets/notes_list_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesListBloc, NotesListState>(
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
    );
  }
}
