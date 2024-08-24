import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/app_drawer.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/main_page/pages_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPageSmall extends StatefulWidget {
  const MainPageSmall(
      {super.key,
      required navigationShell,
      required GlobalKey<ScaffoldState> scaffoldKey})
      : _scaffoldKey = scaffoldKey,
        _navigationShell = navigationShell;
  final StatefulNavigationShell _navigationShell;
  final GlobalKey<ScaffoldState>? _scaffoldKey;

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

  List<NavigationDestination> get _navigationDestinitionBuilder {
    final selectedColor = Theme.of(context).colorScheme.primary;
    final unSelectedColor = Theme.of(context).colorScheme.primary;

    NavigationDestination destinition(PagesEnum page) {
      return NavigationDestination(
        selectedIcon: Icon(page.selectedIcon, color: selectedColor),
        icon: Icon(page.icon, color: unSelectedColor),
        label: page.pageName,
      );
    }

    return <NavigationDestination>[
      destinition(PagesEnum.homePage),
      destinition(PagesEnum.tasksPage),
      destinition(PagesEnum.catalogPage),
    ];
  }

  Widget get _bottomNavigationBarBuilder => Container(
        decoration: BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: Theme.of(context).colorScheme.surfaceContainer,
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
        titleWidget: SearchTextField(
          onTap: () => context.push(AppRoutes.notesSearchPage),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: AppDrawer(),
      key: widget._scaffoldKey,

      body: widget._navigationShell,
      bottomNavigationBar: _bottomNavigationBarBuilder,

      //drawer: AppDrawer(),
    );
  }
}
