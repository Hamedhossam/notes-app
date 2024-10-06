import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String tittle;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final int color;

  NoteModel({
    required this.tittle,
    required this.content,
    required this.date,
    required this.color,
    required this.category,
  });
}
