import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_bar_button.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/app_drawer.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/pages_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPageLarge extends StatefulWidget {
  const MainPageLarge({
    super.key,
    required navigationShell,
  }) : _navigationShell = navigationShell;
  final StatefulNavigationShell _navigationShell;

  @override
  State<MainPageLarge> createState() => _MainPageLargeState();
}

class _MainPageLargeState extends State<MainPageLarge> {
  void _onTap(BuildContext context, int index) {
    widget._navigationShell.goBranch(
      index,
      initialLocation: index == widget._navigationShell.currentIndex,
    );
  }

  List<NavigationRailDestination> get _navigationItemsBuilder {
    NavigationRailDestination railDestinition(PagesEnum page) {
      return NavigationRailDestination(
        selectedIcon: Icon(page.selectedIcon),
        icon: Icon(page.icon),
        label: Text(page.pageName),
      );
    }

    return [
      railDestinition(PagesEnum.homePage),
      railDestinition(PagesEnum.tasksPage),
      railDestinition(PagesEnum.catalogPage),
    ];
  }

  Widget get _navigationBuilder => Container(
        decoration: BoxDecoration(
            border: BorderDirectional(
                end: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ))),
        child: NavigationRail(
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
          ),
          groupAlignment: -1,
          indicatorColor: Theme.of(context).colorScheme.surfaceContainer,
          labelType: NavigationRailLabelType.selected,
          leading: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AppBarButton(
                onPressed: Scaffold.of(context).openDrawer,
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.outline,
                ),
              );
            },
          ),
          destinations: _navigationItemsBuilder,
          selectedIndex: widget._navigationShell.currentIndex,
          onDestinationSelected: (int index) => _onTap(context, index),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _navigationBuilder,
          Expanded(
            child: AppWrapper(
              padding: MediaQuery.of(context).size.width > 835
                  ? const EdgeInsets.only(right: 81)
                  : null,
              maxWidth: 700,
              child: widget._navigationShell,
            ),
          ),
        ],
      ),
    );
  }
}
