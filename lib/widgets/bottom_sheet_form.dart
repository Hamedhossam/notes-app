import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/add_note_label.dart';
import 'package:notes/widgets/customized_button.dart';
import 'package:notes/widgets/text_field.dart';

class BottomSheetForm extends StatefulWidget {
  final String selectedCategory;
  const BottomSheetForm({
    super.key,
    required this.selectedCategory,
  });

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? tittle, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const AddNoteLabel(),
          const SizedBox(height: 30),
          CustomizedTextField(
            tittle: 'Tittle',
            maxLines: 1,
            onSaved: (value) => tittle = value,
          ),
          const SizedBox(height: 20),
          CustomizedTextField(
            tittle: 'Content',
            maxLines: 5,
            onSaved: (value) => content = value,
          ),
          const SizedBox(height: 20),
          CustomizedButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                DateTime now = DateTime.now();
                String formattedDate =
                    DateFormat('dd/MM/yyyy HH:mm a').format(now);
                NoteModel noteModel = NoteModel(
                    tittle: tittle!,
                    content: content!,
                    date: formattedDate,
                    color: Colors.blue.value,
                    category: widget.selectedCategory);
                log(widget.selectedCategory);
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
