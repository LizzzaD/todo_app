import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/application/category_bloc/category_bloc.dart';
import '../../features/application/category_bloc/category_event.dart';
import '../../features/application/category_bloc/category_state.dart';
import '../../features/application/task_bloc/task_bloc.dart';
import '../../features/application/task_bloc/task_event.dart';
import '../../features/application/task_bloc/task_state.dart';
import '../../features/domain/models/task_model.dart';
import '../extension/build_context_extension.dart';
import '../ui_kit/buttons/category_button.dart';
import '../ui_kit/buttons/default_button.dart';
import 'add_category_screen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int? selectedIndex;
  TextEditingController titleController = TextEditingController();
  final EasyDatePickerController _dateController = EasyDatePickerController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      appBar: AppBar(
        title: Text('Create task'),
        backgroundColor: context.colors.backgroundColor,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Padding(
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
                    Text('Category:', style: context.styles.medium16),
                    SizedBox(height: 8),
                    BlocBuilder<CategoryBloc, CategoryState>(
                      builder: (context, categoryState) {
                        if (categoryState is CategoriesLoaded) {
                          return Wrap(
                            spacing: 8,
                            children: [
                              ...List.generate(
                                categoryState.categories.length,
                                (index) {
                                  final category =
                                      categoryState.categories[index];
                                  return CategoryButton(
                                    title: category.title,
                                    color: category.color,
                                    isSelected: selectedIndex == index,
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),

                              ElevatedButton(
                                style: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 2),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    context.colors.textSecondaryColor,
                                  ),
                                  foregroundColor: WidgetStatePropertyAll(
                                    context.colors.white,
                                  ),
                                  shape: WidgetStatePropertyAll(CircleBorder()),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddCategoryScreen(),
                                    ),
                                  ).then((_) {
                                    context.read<CategoryBloc>().add(
                                      LoadCategoriesEvent(),
                                    );
                                  });
                                },
                                child: const Icon(Icons.add, size: 24),
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),

                    EasyDateTimeLinePicker(
                      controller: _dateController,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030, 3, 18),
                      focusedDate: _selectedDate,
                      onDateChange: (selectedDate) {
                        setState(() {
                          _selectedDate = selectedDate;
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
                        final category =
                            (context.read<CategoryBloc>().state
                                    as CategoriesLoaded)
                                .categories[selectedIndex!];
                        final taskModel = TaskModel(
                          title: titleController.text,
                          categoryId: category.id!,
                          isCompleted: false,
                          date: _selectedDate,
                        );
                        context.read<TaskBloc>().add(
                          AddTaskEvent(taskModel: taskModel),
                        );
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
