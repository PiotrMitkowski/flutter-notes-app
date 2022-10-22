import 'package:flutter/foundation.dart';
import 'package:flutter_notes_app/data/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NotesRepository {
  late Isar _isar;

  Future<void> initialize() async {
    final supportDirectory = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      schemas: [NoteSchema],
      directory: supportDirectory.path,
      inspector: kDebugMode,
    );
  }

  Stream<List<Note>> getNotes() {
    return _isar.notes
        .where()
        .sortByCreationDateDesc()
        .build()
        .watch(initialReturn: true);
  }

  Future<void> saveNote(Note note) async {
    await _isar.writeTxn((isar) async {
      await isar.notes.put(note);
    });
  }
}
