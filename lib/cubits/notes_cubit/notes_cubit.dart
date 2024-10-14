import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());

  List<NoteModel> allNotes = [];
  List<NoteModel> selectedNotes = [];

  getAllNotes(String categoryName) {
    try {
      var notesBox = Hive.box<NoteModel>("notes");
      allNotes = notesBox.values.toList();
      for (var i = 0; i < allNotes.length; i++) {
        if (allNotes[i].category == "all") {
        } else {
          selectedNotes = getSelectedNotes(categoryName);
        }
      }
      if (categoryName == "all") {
        emit(NoteSuccessState(
          notes: allNotes.reversed.toList(),
        ));
      } else {
        emit(NoteSuccessState(
          notes: selectedNotes.reversed.toList(),
        ));
      }
    } catch (e) {
      log(e.toString());
      emit(NoteFailureState(errmessage: e.toString()));
    }
  }

  List<NoteModel> getSelectedNotes(String categoryName) {
    var notesBox = Hive.box<NoteModel>("notes");
    List<NoteModel> targetNotes = [];
    allNotes = notesBox.values.toList();
    for (var i = 0; i < allNotes.length; i++) {
      if (allNotes[i].category == categoryName) {
        targetNotes.add(allNotes[i]);
      }
    }
    return targetNotes;
  }
}
