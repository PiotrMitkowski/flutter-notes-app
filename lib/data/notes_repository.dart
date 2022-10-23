import 'package:flutter_notes_app/data/models/note.dart';

abstract class NotesRepository {
  Stream<List<Note>> getNotes();
  Future<void> saveNote(Note note);
}
