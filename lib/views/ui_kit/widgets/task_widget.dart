import 'package:flutter/material.dart';
import '../../extension/build_context_extension.dart';
import 'category_widget.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({
    required this.color,
    required this.title,
    required this.categoryTitle,
    required this.showConfettiAt,
    super.key,
  });

  final Color color;
  final String title;
  final String categoryTitle;
  final void Function(Offset globalPosition) showConfettiAt;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final GlobalKey _checkboxKey = GlobalKey();
  bool _isDone = false;

  void _handleCheckboxChanged(bool? value) {
    setState(() {
      _isDone = value ?? false;
    });

    if (_isDone) {
      final renderBox =
          _checkboxKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(
          renderBox.size.center(Offset.zero),
        );
        widget.showConfettiAt(position);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: widget.color.withValues(alpha: 1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        border: Border.all(color: widget.color, width: 1.5),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: context.styles.semibold16.copyWith(
                  color: context.colors.secondaryColor,
                ),
              ),
              SizedBox(height: 4),
              CategoryWidget(color: widget.color, title: widget.categoryTitle),
            ],
          ),
          Spacer(),
          Checkbox(
            key: _checkboxKey,
            value: _isDone,
            onChanged: _handleCheckboxChanged,
          ),
        ],
      ),
    );
  }
}
