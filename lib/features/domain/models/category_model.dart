import 'package:flutter/material.dart';

import 'model.dart';

class CategoryModel implements Model {
  CategoryModel({this.id, required this.title, required this.color});
  final int? id;
  final String title;
  final Color color;
}
