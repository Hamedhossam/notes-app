import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/categories_cubit/categories_cubit.dart';
import 'package:notes/widgets/add_note_bottom_sheet.dart';
import 'package:notes/widgets/app_bar.dart';
import 'package:notes/widgets/notes_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('⚠️'),
                Text('Add Category first'),
              ],
            ),
          ),
          backgroundColor: Colors.grey[850], // Dark background color
          contentTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CategoriesCubit>(context).categories.isEmpty
              ? _showWarningDialog(context)
              : showModalBottomSheet(
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
    );
  }
}
