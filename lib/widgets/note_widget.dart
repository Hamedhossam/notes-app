import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

class NoteWiget extends StatelessWidget {
  const NoteWiget({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('⚠️ Do you want to delete?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                noteModel.delete();
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
          backgroundColor: Colors.grey[850], // Dark background color
          titleTextStyle: const TextStyle(color: Colors.white),
          contentTextStyle: const TextStyle(color: Colors.white),
        );
      },
    );
  }

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
                  GestureDetector(
                    onTap: () {
                      _showDeleteDialog(context);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(129, 0, 0, 0),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.delete)),
                  ),
                ],
              ),
              subtitle: Text(
                noteModel.content,
                style: const TextStyle(
                    color: Color.fromARGB(165, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  noteModel.date,
                  style: const TextStyle(
                      color: Color.fromARGB(118, 0, 0, 0),
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
