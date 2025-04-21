import 'package:drift/drift.dart';
import '../../app_database/app_database.dart';
import '../table/categories_table.dart';

part 'categories_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase>
    with _$CategoryDaoMixin {
  CategoryDao(super.db);

  /// CREATE
  Future<int> insertCategory(CategoriesCompanion category) =>
      into(categories).insert(category);

  /// READ
  Future<List<Category>> getAllCategory() => select(categories).get();

  Future<Category?> getCategoryById(int id) {
    return (select(categories)
      ..where((c) => c.id.equals(id))).getSingleOrNull();
  }

  /// UPDATE
  Future<bool> updateCategory(CategoriesCompanion category) =>
      update(categories).replace(category);

  /// DELETE
  Future<int> deleteCategory(int id) =>
      (delete(categories)..where((c) => c.id.equals(id))).go();
}
