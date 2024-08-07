import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_bar_button.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/app_drawer.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/pages_enum.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/add_note_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPageLarge extends StatefulWidget {
  const MainPageLarge({super.key, required navigationShell})
      : _navigationShell = navigationShell;
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

  List<NavigationRailDestination> get _navigationItemsBuilder => [
        NavigationRailDestination(
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: Text(PagesEnum.homePage.pageName),
        ),
        NavigationRailDestination(
          selectedIcon: const Icon(Icons.bookmark_added),
          icon: const Icon(Icons.bookmark_added_outlined),
          label: Text(PagesEnum.completedPage.pageName),
        ),
        NavigationRailDestination(
          selectedIcon: const Icon(Icons.collections_bookmark),
          icon: const Icon(Icons.collections_bookmark_outlined),
          label: Text(PagesEnum.catalogPage.pageName),
        ),
      ];

  Widget get _navigationBuilder => Center(
        child: NavigationRail(
          groupAlignment: -1,
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
          trailing: const AddNoteButton(
            shape: CircleBorder(),
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
              padding: const EdgeInsets.only(right: 81),
              maxWidth: 700,
              child: Scaffold(
                appBar: CustomAppBar(
                  context: context,
                  titleWidget: HeroSearchWidget(
                    onTap: () => context.push(AppRoutes.notesSearchPage),
                  ),
                  leadingIsAutomaticlySet: false,
                ),
                body: widget._navigationShell,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
