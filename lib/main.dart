import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/application/category_bloc/category_bloc.dart';
import 'features/application/category_bloc/category_event.dart';
import 'features/application/task_bloc/task_bloc.dart';
import 'features/application/task_bloc/task_event.dart';
import 'features/data/repositories/category_repository_impl.dart';
import 'features/data/repositories/task_repository_impl.dart';
import 'features/data/sources/database/app_database/app_database.dart';
import 'features/data/sources/mappers/category_mapper.dart';
import 'features/data/sources/mappers/task_mapper.dart';
import 'views/screens/all_tasks_screen.dart';
import 'views/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppDatabase db = AppDatabase();

  @override
  Widget build(BuildContext context) {
    final taskRepository = TaskRepositoryImpl(
      taskDao: db.taskDao,
      taskMapper: TaskMapper(),
    );
    final categoryRepository = CategoryRepositoryImpl(
      categoryDao: db.categoryDao,
      categoryMapper: CategoryMapper(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  TaskBloc(taskRepository, categoryRepository)
                    ..add(LoadTasksEvent()),
        ),
        BlocProvider(
          create:
              (_) =>
                  CategoryBloc(categoryRepository)..add(LoadCategoriesEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getLightTheme,
        home: AllTasksScreen(),
      ),
    );
  }
}
