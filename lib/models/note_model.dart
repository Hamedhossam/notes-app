import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String tittle;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;
  @HiveField(3)
  final String category;
  @HiveField(4)
  int color;

  NoteModel({
    required this.tittle,
    required this.content,
    required this.date,
    required this.color,
    required this.category,
  });
}
