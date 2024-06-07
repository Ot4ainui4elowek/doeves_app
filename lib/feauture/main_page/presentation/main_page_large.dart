import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:doeves_app/feauture/home_page/presentation/widgets/add_note_button/add_note_button.dart';
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

  Widget get _navigationBuilder => NavigationRail(
        leading: const AddNoteButton(),
        destinations: const <NavigationRailDestination>[
          NavigationRailDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            selectedIcon: Icon(Icons.bookmark_added),
            icon: Icon(Icons.bookmark_added_outlined),
            label: Text('Finished'),
          ),
          NavigationRailDestination(
            selectedIcon: Icon(Icons.collections_bookmark),
            icon: Icon(Icons.collections_bookmark_outlined),
            label: Text('Collections'),
          ),
        ],
        selectedIndex: widget._navigationShell.currentIndex,
        onDestinationSelected: (int index) => _onTap(context, index),
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _navigationBuilder,
        Expanded(
          child: AppWrapper(
              child: Scaffold(
                  appBar: CustomAppBar(
                    context: context,
                    titleWidget: HeroSearchWidget(
                      onTap: () => context.push(AppRoutes.notesSearchPage),
                    ),
                  ),
                  body: widget._navigationShell)),
        ),
      ],
    );
  }
}
