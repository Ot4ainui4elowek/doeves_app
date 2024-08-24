import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt,
              size: 75, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(width: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogoAnimated(
                width: 165,
                curve: Curves.linear,
                repeat: true,
                // color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                'This is tasks page!',
                style: AppTextTheme.text2Xl(weight: TextWeight.bold)
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
