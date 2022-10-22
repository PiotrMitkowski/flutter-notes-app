import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key,
    required this.form,
  });

  final FormState form;

  @override
  Widget build(BuildContext context) {
    final labels = context.l10n;
    return TextButton(
      key: const Key('save_button'),
      onPressed: () {
        final isValid = form.validate();
        if (isValid) {
          context.read<AddNoteBloc>().add(const AddNoteSubmitted());
        }
      },
      child: Text(
        labels.saveButtonTitle,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
