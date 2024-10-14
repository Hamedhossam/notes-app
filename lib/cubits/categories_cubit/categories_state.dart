part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<String>? categories;

  CategoriesSuccess({required this.categories});
}

final class CategoriesEmpty extends CategoriesState {}
