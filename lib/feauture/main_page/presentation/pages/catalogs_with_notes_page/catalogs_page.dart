import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/counter_widget.dart';
import 'package:doeves_app/core/presentation/scrollable_row.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/drawer_service.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/burger_menu_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/search_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CatalogsPage extends StatefulWidget {
  const CatalogsPage(
      {super.key, required this.vm, required DrawerService drawerService})
      : _drawerService = drawerService;

  final CatalogsPageViewModel vm;
  final DrawerService _drawerService;

  @override
  State<CatalogsPage> createState() => _CatalogsPageState();
}

class _CatalogsPageState extends State<CatalogsPage> {
  CatalogsPageViewModel get vm => widget.vm;

  Widget get _selectionModeButtonBuilder => vm.isSelectedMode.observer(
        (context, value) => SelectionModeButton(
          isSelectedMode: vm.isSelectedMode.value,
          onPressed: () => vm.isSelectedMode(!value),
        ),
      );

  Widget get _selectedNotesCountBuilder => Obs(
        rvList: [
          vm.isSelectedMode,
        ],
        builder: (context) => AnimatedVisibility(
          visible: vm.isSelectedMode.value,
          child: Container(
            width: 44,
            margin: const EdgeInsets.only(right: 10),
            child: CounterWidget(
              style: AppTextTheme.textBase(
                  weight: TextWeight.medium,
                  color: Theme.of(context).colorScheme.primary),
              count: 0,
            ),
          ),
        ),
      );

  Widget get _selectedListActionButtonsBuilder => Flexible(
        child: vm.isSelectedMode.observer(
          (context, value) => AnimatedVisibility(
            visible: value,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(28)),
              clipBehavior: Clip.antiAlias,
              child: const ScrollableRow(
                children: [],
              ),
            ),
          ),
        ),
      );

  PreferredSizeWidget get _bottomAppBarBuilder => AppBar(
        toolbarHeight: 68,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _selectedNotesCountBuilder,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _selectedListActionButtonsBuilder,
                  const SizedBox(width: 10),
                  _selectionModeButtonBuilder,
                ],
              ),
            ),
          ],
        ),
      );

  Widget get _refreshButtonBuilder => Visibility(
        visible: !DeviceInfo.checkIsTouchDevice(context),
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          child: RefreshButton(
            onPressed: () {},
          ),
        ),
      );

  Widget get _searchButtonBuilder => Expanded(
        child: SearchButton(
          onPressed: () => context.push(AppRoutes.notesSearchPage),
        ),
      );

  SliverAppBar get _appBarBuilder => SliverAppBar(
      toolbarHeight: 65,
      bottom: _bottomAppBarBuilder,
      title: Row(
        children: [
          BurgerMenuButton(
            onPressed: widget._drawerService.openDrawer,
          ),
          Visibility(
            visible: DeviceInfo.checkIsSmallMainScreen(context),
            child: const SizedBox(width: 10),
          ),
          _refreshButtonBuilder,
          _searchButtonBuilder,
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBarBuilder,
      ],
    ));
  }
}
