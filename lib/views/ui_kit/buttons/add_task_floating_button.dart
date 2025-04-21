import 'package:flutter/material.dart';
import '../../extension/build_context_extension.dart';
import '../../screens/add_task_screen.dart';
import '../widgets/animated_background.dart';

class AddTaskFloatingButton extends StatelessWidget {
  const AddTaskFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 56,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AnimatedBackground(),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskScreen()),
              );
            },
            backgroundColor: Colors.transparent,
            foregroundColor: context.colors.white,
            child: Icon(Icons.add_rounded, size: 32),
          ),
        ],
      ),
    );
  }
}
