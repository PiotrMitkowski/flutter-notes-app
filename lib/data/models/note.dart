import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class Note {
  int id = Isar.autoIncrement;

  late String content;
  late DateTime creationDate;
}
