import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  List<String> categories = [];

  getCategories() {
    var categoriesBox = Hive.box<String>("categories");
    categories = categoriesBox.values.toList();
    if (categories.isEmpty) {
      emit(CategoriesEmpty());
    } else {
      emit(CategoriesSuccess(categories: categories));
    }
  }
}
