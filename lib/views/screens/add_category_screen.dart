import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/application/category_bloc/category_bloc.dart';
import '../../features/application/category_bloc/category_event.dart';
import '../../features/domain/models/category_model.dart';
import '../extension/build_context_extension.dart';
import '../ui_kit/buttons/default_button.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  int selectedColorIndex = 0;
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      context.colors.blue,
      context.colors.pink,
      context.colors.yellow,
      context.colors.green,
      context.colors.lightBlue,
      context.colors.red,
      context.colors.orange,
    ];
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: AppBar(
        title: Text('Create category'),
        backgroundColor: context.colors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text('Title:', style: context.styles.medium16),
                SizedBox(height: 8),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Color:', style: context.styles.medium16),
                SizedBox(height: 16),
                ColorPicker(
                  colors: colors,
                  selectedIndex: selectedColorIndex,
                  onIndexSelected: (index) {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultButton(
                  title: 'Save',
                  onPressed: () {
                    final categoryModel = CategoryModel(
                      title: titleController.text,
                      color: colors[selectedColorIndex],
                    );
                    context.read<CategoryBloc>().add(
                      AddCategoryEvent(categoryModel: categoryModel),
                    );
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final List<Color> colors;
  final int selectedIndex;
  final ValueChanged<int> onIndexSelected;

  const ColorPicker({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onIndexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: List.generate(colors.length, (index) {
        final isSelected = index == selectedIndex;

        return GestureDetector(
          onTap: () => onIndexSelected(index),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colors[index],
              shape: BoxShape.circle,
              border:
                  isSelected
                      ? Border.all(
                        color: context.colors.secondaryColor.withOpacity(0.4),
                        width: 1,
                      )
                      : null,
            ),
          ),
        );
      }),
    );
  }
}
