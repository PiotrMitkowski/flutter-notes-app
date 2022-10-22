import 'package:flutter_notes_app/data/models/note.dart';
import 'package:isar/isar.dart';

class NotesRepository {
  late Isar _isar;

  Future<void> initialize() async {
    _isar = await Isar.open([NoteSchema]);
  }

  Stream<List<Note>> getNotes() {
    return _isar.notes.where().sortByCreationDateDesc().watch();
  }

  Future<void> saveNote(Note note) async {
    await _isar.writeTxn(() async {
      await _isar.notes.put(note);
    });
  }
}
