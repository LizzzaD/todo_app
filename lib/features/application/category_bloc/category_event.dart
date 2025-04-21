import '../../domain/models/category_model.dart';

sealed class CategoryEvent {}

class LoadCategoriesEvent extends CategoryEvent {}

class AddCategoryEvent extends CategoryEvent {
  AddCategoryEvent({required this.categoryModel});
  final CategoryModel categoryModel;
}

class DeleteCategoryEvent extends CategoryEvent {
  DeleteCategoryEvent({required this.categoryId});
  final int categoryId;
}
