import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/add_note/bloc/add_note_bloc.dart';
import 'package:flutter_notes_app/data/repository.dart';

class AddNoteScreen extends StatefulWidget {
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
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteBloc, AddNoteState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == AddNoteStatus.success,
      listener: (context, state) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add note'),
          actions: [
            TextButton(
              key: const Key('save_button'),
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (isValid) {
                  context.read<AddNoteBloc>().add(const AddNoteSubmitted());
                }
              },
              child: const Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
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
                    context
                        .read<AddNoteBloc>()
                        .add(AddNoteContentChanged(value));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
