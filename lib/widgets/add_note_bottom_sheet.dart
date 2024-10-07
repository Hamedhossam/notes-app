import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/bottom_sheet_form.dart';
import 'package:notes/widgets/customized_snack_bar.dart';

class AddNoteBottomSheet extends StatelessWidget {
  final String selectedCategory;
  const AddNoteBottomSheet({
    super.key,
    required this.selectedCategory,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            right: 8.0,
            left: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
          listener: (BuildContext context, AddNoteCubitState state) async {
            if (state is AddNoteSuccessState) {
              await Future.delayed(const Duration(seconds: 1));
              BlocProvider.of<NotesCubit>(context).getAllNotes(categoryName);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context)
                  .showSnackBar(customizedSnackBar("note Added ✅ "));
            } else if (state is AddNoteFailureState) {
              log("Error ${state.errMessage}");
              await Future.delayed(const Duration(seconds: 2));
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is AddNoteLoadingState) {
              return const AbsorbPointer(
                  absorbing: true,
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is AddNoteFailureState) {
              return Center(
                  child: LottieBuilder.asset("assets/lottie/failed.json"));
            } else if (state is AddNoteSuccessState) {
              return Center(
                  child: LottieBuilder.asset("assets/lottie/success.json"));
            } else {
              return SingleChildScrollView(
                  child: BottomSheetForm(selectedCategory: selectedCategory));
            }
          },
        ),
      ),
    );
  }
}
