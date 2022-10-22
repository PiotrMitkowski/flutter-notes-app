import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

class NoteField extends StatelessWidget {
  const NoteField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final labels = context.l10n;
    return TextFormField(
      key: const Key('note_text_field'),
      minLines: 3,
      maxLines: null,
      style: theme.textTheme.headline1,
      decoration: InputDecoration(
        hintText: labels.noteFieldHint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return labels.noteFieldValidationError;
        }
        return null;
      },
      onChanged: (value) {
        context.read<AddNoteBloc>().add(AddNoteContentChanged(value));
      },
    );
  }
}
