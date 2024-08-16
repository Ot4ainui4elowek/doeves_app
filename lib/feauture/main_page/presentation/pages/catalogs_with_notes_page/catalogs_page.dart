import 'dart:math';

import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/counter_widget.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/scrollable_row.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/drawer_service.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/burger_menu_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/search_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        forceMaterialTransparency: true,
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
            onPressed: vm.refreshCatalogs,
          ),
        ),
      );

  Widget get _searchButtonBuilder => Expanded(
        child: SearchButton(
          onPressed: () => context.push(AppRoutes.notesSearchPage),
        ),
      );

  SliverAppBar get _appBarBuilder => SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      toolbarHeight: 65,
      bottom: _bottomAppBarBuilder,
      backgroundColor: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
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

  Widget get _catlogsBlocBuilder => vm.catalogsList.observer(
        (context, value) => ConstrainedBox(
          constraints: BoxConstraints(
              minHeight:
                  value.isEmpty ? MediaQuery.of(context).size.height - 300 : 0),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: BlocBuilder(
                bloc: vm.catalogsBloc,
                builder: (context, state) {
                  return vm.catalogsBloc.state.maybeWhen(
                    orElse: () => const SizedBox(height: 0),
                    emptyResponse: () => const Text('All catalogs are loaded!'),
                    loading: () => AppLogoAnimated(
                      repeat: true,
                      width: min(MediaQuery.of(context).size.width, 200),
                    ),
                    initial: () => const Text(
                        'You don\'t have any catalogs. Add them and they will appear here.'),
                    error: (error) => Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.error,
                          size: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          error.code,
                          textAlign: TextAlign.center,
                          style: AppTextTheme.textXl(weight: TextWeight.medium)
                              .copyWith(
                                  color: Theme.of(context).colorScheme.error),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

  Widget _catalogWidgetBuilder(CatalogResponseModel catalog) => Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              const Icon(Icons.folder_open_outlined),
              const SizedBox(width: 10),
              Flexible(child: Text(catalog.name))
            ],
          ),
        ),
      );

  @override
  void initState() {
    vm.init();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    vm.init();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: vm.scrollController,
      slivers: [
        _appBarBuilder,
        SliverToBoxAdapter(
          child: Obs(
            rvList: [vm.catalogsList, vm.isSelectedMode, vm.selectedList],
            builder: (context) => ReorderableListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              footer: _catlogsBlocBuilder,
              buildDefaultDragHandles: false,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  ReorderableDelayedDragStartListener(
                index: index,
                key: ValueKey(vm.catalogsList[index]),
                child: SelectableContainer(
                  isSelectedMode: vm.isSelectedMode.value,
                  thisItemIsSelected:
                      vm.selectedList.value.contains(vm.catalogsList[index].id),
                  child: _catalogWidgetBuilder(vm.catalogsList[index]),
                ),
              ),
              itemCount: vm.catalogsList.length,
              onReorder: (oldIndex, newIndex) {},
            ),
          ),
        )
      ],
    ));
  }
}
