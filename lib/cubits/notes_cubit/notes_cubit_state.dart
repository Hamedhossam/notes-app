part of 'notes_cubit.dart';

@immutable
abstract class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NotesLoadingState extends NotesCubitState {}

final class NoteSuccessState extends NotesCubitState {
  final List<NoteModel> notes;

  NoteSuccessState({required this.notes});
}

final class NoteFailureState extends NotesCubitState {
  final String errmessage;

  NoteFailureState({required this.errmessage});
}
