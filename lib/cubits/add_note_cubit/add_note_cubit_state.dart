part of 'add_note_cubit_cubit.dart';

@immutable
abstract class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteLoadingState extends AddNoteCubitState {}

class AddNoteFailureState extends AddNoteCubitState {
  final String errMessage;

  AddNoteFailureState(this.errMessage);
}

class AddNoteSuccessState extends AddNoteCubitState {}
