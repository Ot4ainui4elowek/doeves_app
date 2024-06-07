import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPageSmall extends StatefulWidget {
  const MainPageSmall({super.key, required navigationShell})
      : _navigationShell = navigationShell;
  final StatefulNavigationShell _navigationShell;

  @override
  State<MainPageSmall> createState() => MainPageSmallState();
}

class MainPageSmallState extends State<MainPageSmall> {
  final logo = const AssetImage('assets/images/logo.png');
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

  PreferredSizeWidget get _appBarBuilder => CustomAppBar(
        context: context,
        titleWidget: Expanded(
          child: HeroSearchWidget(
            onTap: () => context.push(AppRoutes.notesSearchPage),
          ),
        ),
        leadeing: StatefulBuilder(
          builder: (BuildContext context, setState) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.outline,
              ),
              padding: const EdgeInsets.all(16),
              onPressed: Scaffold.of(context).openDrawer,
            );
          },
        ),
      );
  Widget get _appDrawerBuilder => Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image(
                width: 120,
                image: logo,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder,
      body: widget._navigationShell,
      bottomNavigationBar: _bottomNavBarBuilder,
      drawer: _appDrawerBuilder,
    );
  }
}
