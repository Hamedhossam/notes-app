import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/app_bar.dart';
import 'package:notes/widgets/customized_button.dart';
import 'package:notes/widgets/text_field.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController tittleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    tittleController.text = widget.noteModel.tittle;
    contentController.text = widget.noteModel.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit),
                Text("Edit Notes",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomizedTextField(
              tittle: "tittle",
              maxLines: 1,
              controller: tittleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomizedTextField(
              tittle: "content",
              maxLines: 7,
              controller: contentController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomizedButton(
              tittle: "Save",
              onTap: () {
                widget.noteModel.tittle = tittleController.text;
                widget.noteModel.content = contentController.text;
                widget.noteModel.date = "(edited) ${widget.noteModel.date}";
                widget.noteModel.save();
                BlocProvider.of<NotesCubit>(context).getAllNotes(categoryName);
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
