import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoevesMainPage extends StatefulWidget {
  const DoevesMainPage({super.key, required navigationShell})
      : _navigationShell = navigationShell;
  final StatefulNavigationShell _navigationShell;

  @override
  State<DoevesMainPage> createState() => DoevesMainPageState();
}

class DoevesMainPageState extends State<DoevesMainPage> {
  void _onTap(BuildContext context, int index) {
    widget._navigationShell.goBranch(
      index,
      initialLocation: index == widget._navigationShell.currentIndex,
    );
  }

  Widget get _bottomNavBarBuilder => NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) => _onTap(context, index),
        selectedIndex: widget._navigationShell.currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark_added),
            icon: Icon(Icons.bookmark_added_outlined),
            label: 'Finished',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.collections_bookmark),
            icon: Icon(Icons.collections_bookmark_outlined),
            label: 'Collections',
          ),
        ],
      );

  Widget get _addNoteButtonBuilder => FloatingActionButton(
      onPressed: () {
        context.push(AppRoutes.selectNewNotePage);
      },
      child: const Icon(Icons.add_rounded));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWrapper(
        child: Scaffold(
          body: widget._navigationShell,
          bottomNavigationBar: _bottomNavBarBuilder,
        ),
      ),
    );
  }
}
