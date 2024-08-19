import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/counter_widget.dart';
import 'package:doeves_app/core/presentation/scrollable_row.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/drawer_service.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/burger_menu_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/search_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/select_all_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/response_bloc_buidler.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
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
        rvList: [vm.isSelectedMode, vm.selectedList],
        builder: (context) => AnimatedVisibility(
          visible: vm.isSelectedMode.value,
          child: Container(
            width: 44,
            margin: const EdgeInsets.only(right: 10),
            child: CounterWidget(
              style: AppTextTheme.textBase(
                  weight: TextWeight.medium,
                  color: Theme.of(context).colorScheme.primary),
              count: vm.selectedList.length,
            ),
          ),
        ),
      );

  Widget get _selectedListActionButtonsBuilder => Flexible(
        child: vm.isSelectedMode.observer(
          (context, value) => AnimatedVisibility(
            visible: value,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 44),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(28)),
              clipBehavior: Clip.antiAlias,
              child: ScrollableRow(
                children: [
                  _selectAllCatalogsBuilder,
                  _deleteCatalogsButtonBuilder,
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _selectAllCatalogsBuilder => Obs(
        rvList: [vm.catalogsList, vm.allCatalogsIsSelected],
        builder: (context) => Container(
          margin: const EdgeInsets.only(right: 10),
          child: SelectAllButton(
            listIsSelected: vm.allCatalogsIsSelected.value,
            onPressed: vm.catalogsList.isNotEmpty && vm.isSelectedMode.value
                ? vm.onPressedSelectAllButton
                : null,
          ),
        ),
      );

  Widget get _deleteCatalogsButtonBuilder => Obs(
        rvList: [vm.selectedList],
        builder: (context) => AppElevatedButton(
          mini: true,
          onPressed: vm.selectedList.isNotEmpty
              ? () => vm.deleteCatalogs(context)
              : null,
          child: const Icon(Icons.delete_outline_rounded),
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

  Widget get _refreshButtonBuilder => Obs(
        rvList: [vm.isSelectedMode],
        builder: (context) => Visibility(
          visible: !DeviceInfo.checkIsTouchDevice(context),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: RefreshButton(
              onPressed: !vm.isSelectedMode.value ? vm.refreshCatalogs : null,
            ),
          ),
        ),
      );

  Widget get _searchButtonBuilder => SearchButton(
        onPressed: () => context.push(AppRoutes.notesSearchPage),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BurgerMenuButton(
                onPressed: widget._drawerService.openDrawer,
              ),
              Visibility(
                visible: DeviceInfo.checkIsSmallMainScreen(context),
                child: const SizedBox(width: 10),
              ),
              _refreshButtonBuilder,
            ],
          ),
          _searchButtonBuilder,
        ],
      ));

  Widget get _catlogsBlocBuilder => vm.catalogsList.observer(
        (context, value) => ConstrainedBox(
          constraints: BoxConstraints(
              minHeight:
                  value.isEmpty ? MediaQuery.of(context).size.height - 300 : 0),
          child: ResponseBlocBuidler(
            bloc: vm.catalogsBloc,
            emptyResponseText: 'All catalogs are loaded!',
            epmtyListText:
                'You don\'t have any catalogs. Add them and they will appear here.',
          ),
        ),
      );

  Widget _catalogWidgetBuilder(
          {required CatalogResponseModel catalog,
          required void Function() onTap}) =>
      Center(
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              const Icon(Icons.folder_open_outlined),
              const SizedBox(width: 10),
              Flexible(
                  child: Text(
                catalog.name,
                style: AppTextTheme.textBase(weight: TextWeight.medium),
              ))
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
        body: RefreshIndicator(
      onRefresh: vm.refreshCatalogs,
      child: CustomScrollView(
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
                    thisItemIsSelected: vm.selectedList.value
                        .contains(vm.catalogsList[index].id),
                    child: _catalogWidgetBuilder(
                        catalog: vm.catalogsList[index],
                        onTap: () =>
                            vm.onPressedCatalog(vm.catalogsList[index].id)),
                  ),
                ),
                itemCount: vm.catalogsList.length,
                onReorder: (oldIndex, newIndex) {},
              ),
            ),
          )
        ],
      ),
    ));
  }
}
