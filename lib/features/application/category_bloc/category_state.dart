import '../../domain/models/category_model.dart';

sealed class CategoryState {}

class CategoriesInitial extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  CategoriesLoaded(this.categories);
  final List<CategoryModel> categories;
}

class CategoriesError extends CategoryState {
  CategoriesError(this.error);
  final String error;
}
