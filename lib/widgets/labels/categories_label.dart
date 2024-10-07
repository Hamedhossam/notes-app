import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/widgets/text_field.dart';

class CategoriesLabel extends StatefulWidget {
  const CategoriesLabel({
    super.key,
  });

  @override
  State<CategoriesLabel> createState() => _CategoriesLabelState();
}

class _CategoriesLabelState extends State<CategoriesLabel> {
  String? categoryAdded;

  GlobalKey<FormState> formKey = GlobalKey();

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Form(
            key: formKey,
            child: CustomizedTextField(
              tittle: "add category",
              maxLines: 1,
              onChanged: (value) {
                categoryAdded = value;
              },
            ),
          ),

          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  categories.add(categoryAdded!);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('save'),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Notes Sections",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () => _showDeleteDialog(context),
          child: const Padding(
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
        ),
      ],
    );
  }
}
