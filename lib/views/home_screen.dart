import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/add_note_bottom_sheet.dart';
import 'package:notes/widgets/app_bar.dart';
import 'package:notes/widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddNoteBottomSheet(selectedCategory: categoryName);
                });
          },
          child: const Icon(Icons.add_rounded),
        ),
        body: const CustomScrollView(
          slivers: [
            CustomizedAppBar(),
            NotesListView(),
          ],
        ),
      ),
    );
  }
}
