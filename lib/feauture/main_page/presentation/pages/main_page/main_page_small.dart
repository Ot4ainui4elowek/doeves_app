import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/app_drawer.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/pages_enum.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/add_note_button.dart';
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
  void _onTap(BuildContext context, int index) {
    widget._navigationShell.goBranch(
      index,
      initialLocation: index == widget._navigationShell.currentIndex,
    );
  }

  List<NavigationDestination> get _navigationDestinitionBuilder =>
      <NavigationDestination>[
        NavigationDestination(
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: PagesEnum.homePage.pageName,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.bookmark_added),
          icon: const Icon(Icons.bookmark_added_outlined),
          label: PagesEnum.completedPage.pageName,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.collections_bookmark),
          icon: const Icon(Icons.collections_bookmark_outlined),
          label: PagesEnum.catalogPage.pageName,
        ),
      ];

  Widget get _bottomNavigationBarBuilder => BottomAppBar(
        padding: const EdgeInsets.only(right: 75),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          onDestinationSelected: (int index) => _onTap(context, index),
          selectedIndex: widget._navigationShell.currentIndex,
          destinations: _navigationDestinitionBuilder,
        ),
      );

  Widget get _burgerMenuButtonBuilder => StatefulBuilder(
        builder: (BuildContext context, setState) {
          return IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.outline,
            ),
          );
        },
      );

  PreferredSizeWidget get _appBarBuilder => CustomAppBar(
        context: context,
        leadeing: _burgerMenuButtonBuilder,
        titleWidget: HeroSearchWidget(
          onTap: () => context.push(AppRoutes.notesSearchPage),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder,
      body: widget._navigationShell,
      bottomNavigationBar: _bottomNavigationBarBuilder,
      drawer: AppDrawer(),
      floatingActionButton: const AddNoteButton(
        elevation: 0,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
