import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try {
      var notesBox = Hive.box<NoteModel>("notes");
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
