import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';
import 'package:flutter_notes_app/add_note/widgets/note_field.dart';
import 'package:flutter_notes_app/add_note/widgets/save_note_button.dart';
import 'package:flutter_notes_app/data/repository.dart';
import 'package:flutter_notes_app/l10n/l10n.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => AddNoteBloc(
          context.read<NotesRepository>(),
        ),
        child: AddNoteScreen(),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final labels = context.l10n;
    return BlocListener<AddNoteBloc, AddNoteState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == AddNoteStatus.success,
      listener: (context, state) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(labels.addNoteScreenTitle),
          actions: [
            SaveNoteButton(form: _formKey.currentState!),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: const NoteField(),
          ),
        ),
      ),
    );
  }
}
