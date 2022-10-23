import 'package:flutter/foundation.dart';
import 'package:flutter_notes_app/data/data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalNotesRepository extends NotesRepository {
  LocalNotesRepository() {
    _isar = _openDb();
  }

  late Future<Isar> _isar;

  @override
  Stream<List<Note>> getNotes() async* {
    final isar = await _isar;
    yield* isar.notes
        .where()
        .sortByCreationDateDesc()
        .build()
        .watch(initialReturn: true);
  }

  @override
  Future<void> saveNote(Note note) async {
    final isar = await _isar;
    // added for testing purposes to notice the loading state
    await Future<void>.delayed(const Duration(seconds: 2));
    await isar.writeTxn((isar) async {
      await isar.notes.put(note);
    });
  }

  Future<Isar> _openDb() async {
    final supportDirectory = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        schemas: [NoteSchema],
        directory: supportDirectory.path,
        inspector: kDebugMode,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
