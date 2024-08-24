import 'package:flutter/material.dart';

enum PagesEnum {
  homePage(
    pageName: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  tasksPage(
    pageName: 'Tasks',
    icon: Icons.task_outlined,
    selectedIcon: Icons.task,
  ),
  catalogPage(
    pageName: 'Catalogs',
    icon: Icons.collections_bookmark_outlined,
    selectedIcon: Icons.collections_bookmark,
  );

  final String pageName;
  final IconData icon;
  final IconData selectedIcon;
  const PagesEnum({
    required this.pageName,
    required this.icon,
    required this.selectedIcon,
  });
}
