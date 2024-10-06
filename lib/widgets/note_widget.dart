import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class NoteWiget extends StatelessWidget {
  const NoteWiget({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    noteModel.tittle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(129, 0, 0, 0),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.edit)),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  noteModel.content,
                  style: const TextStyle(
                      color: Color.fromARGB(148, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  noteModel.date,
                  style: const TextStyle(
                      color: Color.fromARGB(148, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
