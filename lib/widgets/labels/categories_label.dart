import 'package:flutter/material.dart';

class CategoriesLabel extends StatelessWidget {
  const CategoriesLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes Sections",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Card(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            color: Color.fromARGB(149, 158, 158, 158),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
