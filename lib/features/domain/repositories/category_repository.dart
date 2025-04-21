import '../models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getAllCategories();
  Future<CategoryModel?> getCategoryById(int id);
  Future<int> insertCategory(CategoryModel task);
  Future<bool> updateCategory(CategoryModel category);
  Future<int> deleteCategory(int id);
}
