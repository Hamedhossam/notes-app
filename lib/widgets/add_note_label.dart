import 'package:flutter/material.dart';

class AddNoteLabel extends StatelessWidget {
  const AddNoteLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset("assets/images/noteIcon.png", height: 35),
          const Text("Add Note",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
