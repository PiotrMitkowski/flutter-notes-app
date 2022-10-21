import 'package:flutter/material.dart';
import 'package:flutter_notes_app/add_note/view/add_note_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                  ' Suspendisse egestas malesuada risus a lobortis. '
                  'Nullam mollis vehicula sem, sed mollis neque'
                  ' dignissim eget. Nullam lacinia id leo nec semper.',
                  key: Key('note_body'),
                ),
                SizedBox(height: 4),
                Text('Created: 2022-10-12, 12:04', textAlign: TextAlign.right),
              ],
            )
          ],
        ),
      ),
    );
  }
}
