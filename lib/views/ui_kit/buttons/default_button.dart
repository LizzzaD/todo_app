import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            context.colors.secondaryColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: context.styles.medium16.copyWith(color: context.colors.white),
        ),
      ),
    );
  }
}
