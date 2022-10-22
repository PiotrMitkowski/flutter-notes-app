import 'package:flutter/material.dart';
import 'package:flutter_notes_app/data/models/note.dart';
import 'package:intl/intl.dart';

class NotesListItem extends StatelessWidget {
  const NotesListItem({super.key, required this.note});

  final Note note;

  String _formatCreationDate(DateTime rawDate) {
    final formatter = DateFormat('EEE, d MMM y, HH:mm');
    return formatter.format(rawDate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            note.content,
            key: const Key('note_body'),
            style: theme.textTheme.headline1,
          ),
          const SizedBox(height: 6),
          Text(
            'Created: ${_formatCreationDate(note.creationDate)}',
            textAlign: TextAlign.right,
            style: theme.textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
