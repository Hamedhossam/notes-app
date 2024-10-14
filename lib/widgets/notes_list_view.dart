import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/categories_cubit/categories_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/labels/categories_label.dart';
import 'package:notes/widgets/labels/nots_labed.dart';
import 'package:notes/widgets/note_widget.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });
  // static const List<Color> notesColor = [
  //   Color(0xffEA7A53),
  //   Color(0xffA6D572),
  //   Color(0xffFFD246),
  //   Color(0xffEA7A53),
  //   Color(0xffA6D572),
  //   Color(0xffFFD246),
  //   Color(0xffEA7A53),
  //   Color(0xffA6D572),
  //   Color(0xffFFD246),
  //   Color(0xffEA7A53),
  //   Color(0xffA6D572),
  //   Color(0xffFFD246),
  // ];

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  int selectedIndex = 0;
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes(categoryName);
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
      children: [
        const CategoriesLabel(),
        //* ====> Categories List View <====
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesSuccess) {
              return SizedBox(
                height: 75,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: BlocProvider.of<CategoriesCubit>(context)
                      .categories
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        categoryName = BlocProvider.of<CategoriesCubit>(context)
                            .categories[index];
                        selectedIndex = index;
                        BlocProvider.of<NotesCubit>(context)
                            .getAllNotes(categoryName);
                      }),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 8),
                        decoration: BoxDecoration(
                          color: (selectedIndex == index)
                              ? const Color(0xffFFD246)
                              : const Color(0xff181818),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          BlocProvider.of<CategoriesCubit>(context)
                              .categories[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: (selectedIndex == index)
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text("no sections added"),
              );
            }
          },
        ),
        const NotesLabel(),
        //*====> Notes List View <====
        BlocBuilder<NotesCubit, NotesCubitState>(
          builder: (context, state) {
            if (state is NoteSuccessState) {
              return SizedBox(
                height: 620,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.notes.isEmpty ? 0 : state.notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NoteWiget(noteModel: state.notes[index]);
                  },
                ),
              );
            } else if (state is NoteFailureState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    ));
  }
}
