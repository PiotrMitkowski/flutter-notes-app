import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';

class NoteField extends StatelessWidget {
  const NoteField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('note_text_field'),
      minLines: 3,
      maxLines: null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter note';
        }
        return null;
      },
      onChanged: (value) {
        context.read<AddNoteBloc>().add(AddNoteContentChanged(value));
      },
    );
  }
}
