import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({required this.color, required this.title, super.key});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        title,
        style: context.styles.medium12.copyWith(color: context.colors.white),
      ),
    );
  }
}
