import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/category_model.dart';
import '../database/app_database/app_database.dart';
import 'drift_mapper.dart';

class CategoryMapper
    implements DriftMapper<CategoryModel, Category, CategoriesCompanion> {
  @override
  CategoryModel fromDataClass(Category dataClass) {
    return CategoryModel(
      id: dataClass.id,
      title: dataClass.title,
      color: Color(dataClass.color),
    );
  }

  @override
  CategoriesCompanion toCompanion(CategoryModel model) {
    return CategoriesCompanion(
      id: model.id != null ? Value(model.id!) : const Value.absent(),
      title: Value(model.title),
      color: Value(model.color.value),
    );
  }
}
