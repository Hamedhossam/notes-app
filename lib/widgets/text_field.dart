import 'package:flutter/material.dart';

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField({
    super.key,
    required this.tittle,
    required this.maxLines,
    this.onSaved,
  });
  final String tittle;
  final int maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "the field is required !";
        } else {
          return null;
        }
      },
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: tittle,
        labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        hintText: "type $tittle of your note",
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
      maxLines: maxLines,
    );
  }
}
