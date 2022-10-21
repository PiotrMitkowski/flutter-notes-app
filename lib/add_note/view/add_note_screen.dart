import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const AddNoteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add note'),
        actions: [
          TextButton(
            key: const Key('save_button'),
            onPressed: () {
              Navigator.pop(context);
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
        child: Column(
          children: [
            TextFormField(
              key: const Key('note_text_field'),
              minLines: 3,
              maxLines: null,
            ),
          ],
        ),
      ),
    );
  }
}
