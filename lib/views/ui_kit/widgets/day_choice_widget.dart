import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class DayChoiceWidget extends StatelessWidget {
  const DayChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: context.colors.white),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [SizedBox(width: 8)],
      ),
    );
  }
}
