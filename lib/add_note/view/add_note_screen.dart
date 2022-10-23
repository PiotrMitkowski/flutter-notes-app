import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';
import 'package:flutter_notes_app/add_note/widgets/note_field.dart';
import 'package:flutter_notes_app/add_note/widgets/save_note_button.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => AddNoteBloc(
          context.read<NotesRepository>(),
        ),
        child: const AddNoteScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labels = context.l10n;
    return MultiBlocListener(
      listeners: [
        BlocListener<AddNoteBloc, AddNoteState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == AddNoteStatus.success,
          listener: (context, state) => Navigator.pop(context),
        ),
        BlocListener<AddNoteBloc, AddNoteState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == AddNoteStatus.error,
          listener: (context, state) => ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(labels.addNoteError),
              ),
            ),
        )
      ],
      child: _AddNoteView(),
    );
  }
}

class _AddNoteView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final labels = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(labels.addNoteScreenTitle),
        actions: [
          SaveNoteButton(
            validateForm: () => _formKey.currentState!.validate(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: const NoteField(),
        ),
      ),
    );
  }
}
