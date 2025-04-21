import '../../domain/models/category_model.dart';
import '../../domain/repositories/category_repository.dart';
import '../sources/database/categories/dao/categories_dao.dart';
import '../sources/mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({
    required this.categoryDao,
    required this.categoryMapper,
  });

  final CategoryDao categoryDao;
  final CategoryMapper categoryMapper;

  @override
  Future<int> insertCategory(CategoryModel categoryModel) {
    final companion = categoryMapper.toCompanion(categoryModel);
    return categoryDao.insertCategory(companion);
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final categories = await categoryDao.getAllCategory();
    return categories.map(categoryMapper.fromDataClass).toList();
  }

  @override
  Future<CategoryModel?> getCategoryById(int id) async {
    final category = await categoryDao.getCategoryById(id);
    if (category == null) return null;

    return categoryMapper.fromDataClass(category);
  }

  @override
  Future<int> deleteCategory(int id) async {
    return categoryDao.deleteCategory(id);
  }

  @override
  Future<bool> updateCategory(CategoryModel categoryModel) {
    final companion = categoryMapper.toCompanion(categoryModel);
    return categoryDao.updateCategory(companion);
  }
}
