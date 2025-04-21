import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    required this.color,
    required this.title,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final Color color;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return isSelected ? color : color.withOpacity(0.4);
        }),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: context.styles.medium12.copyWith(color: context.colors.white),
      ),
    );
  }
}
