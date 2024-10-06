import 'package:flutter/material.dart';

class NotesLabel extends StatelessWidget {
  const NotesLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text("Notes",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
