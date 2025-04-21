import 'package:confetti/confetti.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/application/task_bloc/task_bloc.dart';
import '../../features/application/task_bloc/task_event.dart';
import '../../features/application/task_bloc/task_state.dart';
import '../extension/build_context_extension.dart';
import '../ui_kit/buttons/default_button.dart';
import '../ui_kit/widgets/date_and_progress_widget.dart';
import '../ui_kit/widgets/task_widget.dart';

import '../ui_kit/buttons/add_task_floating_button.dart';

class AllTasksScreen extends StatefulWidget {
  const AllTasksScreen({super.key});

  @override
  State<AllTasksScreen> createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  OverlayEntry? _confettiOverlay;
  ConfettiController? _confettiController;
  final EasyDatePickerController _dateController = EasyDatePickerController();
  DateTime _selectedDate = DateTime.now();

  void _showConfettiAt(Offset position) {
    _confettiOverlay?.remove();
    _confettiController?.dispose();

    final controller = ConfettiController(duration: Duration(seconds: 1));
    final overlay = OverlayEntry(
      builder: (_) {
        return Positioned(
          left: position.dx,
          top: position.dy,
          child: ConfettiWidget(
            confettiController: controller,
            blastDirection: -90,
            gravity: 0.3,
            emissionFrequency: 1,
            numberOfParticles: 20,
            minimumSize: Size(4, 8),
            maximumSize: Size(6, 12),
          ),
        );
      },
    );

    _confettiController = controller;
    _confettiOverlay = overlay;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Overlay.of(context).insert(overlay);
      controller.play();

      Future.delayed(Duration(seconds: 5), () {
        overlay.remove();

        controller.dispose();
        if (_confettiOverlay == overlay) _confettiOverlay = null;
        if (_confettiController == controller) _confettiController = null;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    final today = DateTime.now();
    _selectedDate = today;

    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));

    context.read<TaskBloc>().add(
      LoadTasksEvent(dateStart: start, dateEnd: end),
    );
  }

  @override
  void dispose() {
    _confettiOverlay?.remove();
    _confettiController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Alex 👋',
              style: context.styles.semibold24.copyWith(
                color: context.colors.secondaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Let’s get things done!',
              style: context.styles.regular12.copyWith(
                color: context.colors.textSecondaryColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: context.colors.secondaryColor),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: const AddTaskFloatingButton(),
      backgroundColor: context.colors.backgroundColor,
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          switch (state) {
            case TasksLoading():
              return const Center(child: CircularProgressIndicator());
            case TasksInitial():
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DateAndProgressWidget(date: _selectedDate),
                    SizedBox(height: 8),
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
                    SizedBox(height: 40),
                    Text(
                      'No tasks was created',
                      style: context.styles.regular16.copyWith(
                        color: context.colors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              );
            case TasksLoaded():
              final tasks = state.tasksWithCategories;
              return Column(
                children: [
                  DateAndProgressWidget(date: _selectedDate),
                  SizedBox(height: 8),
                  EasyDateTimeLinePicker(
                    controller: _dateController,
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2030, 3, 18),
                    focusedDate: _selectedDate,
                    onDateChange: (selectedDate) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });

                      final start = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                      );
                      final end = start.add(const Duration(days: 1));

                      context.read<TaskBloc>().add(
                        LoadTasksEvent(dateStart: start, dateEnd: end),
                      );
                    },
                  ),
                  Expanded(
                    child:
                        tasks.isEmpty
                            ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Text(
                                  'No tasks for selected day',
                                  style: context.styles.regular16.copyWith(
                                    color: context.colors.textSecondaryColor,
                                  ),
                                ),
                              ),
                            )
                            : ListView.separated(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 100,
                                top: 20,
                              ),
                              itemCount: tasks.length,
                              itemBuilder: (context, index) {
                                final task = tasks[index];
                                return TaskWidget(
                                  color: task.category.color,
                                  title: task.task.title,
                                  categoryTitle: task.category.title,
                                  showConfettiAt: _showConfettiAt,
                                );
                              },
                              separatorBuilder: (_, __) => SizedBox(height: 16),
                            ),
                  ),
                ],
              );

            case TasksError():
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: context.colors.red,
                        size: 40,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Упс! Что-то пошло не так...',
                        style: context.styles.medium16.copyWith(
                          color: context.colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(state.error, style: context.styles.regular12),
                      const SizedBox(height: 16),
                      DefaultButton(
                        title: 'Повторить',
                        onPressed: () {
                          context.read<TaskBloc>().add(LoadTasksEvent());
                        },
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
