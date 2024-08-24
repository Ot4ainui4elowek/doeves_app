import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/counter_widget.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/scrollable_row.dart';
import 'package:doeves_app/feauture/app_drawer/presentation/drawer_service.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/domain/response_bloc/response_bloc.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/action_on_note_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/burger_menu_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/search_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/select_all_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/response_bloc_buidler.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage(
      {super.key, required this.vm, required DrawerService drawerService})
      : _drawerService = drawerService;
  final NotesHomePageViewModel vm;
  final DrawerService _drawerService;

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage>
    with TickerProviderStateMixin {
  NotesHomePageViewModel get vm => widget.vm;

  void _showActionsBottomSheet() {
    showModalBottomSheet(
      showDragHandle: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => _actionsBottomSheetBuilder,
    );
  }

  List<ActionOnNoteButton> get _noteActionsButtonList => [
        ActionOnNoteButton(
          actionText: 'Delete',
          icon: Icons.delete_outline,
          onPressed: vm.selectedNotesList.isNotEmpty
              ? () async => vm.deleteNotesOnPressed(context)
              : null,
        ),
        ActionOnNoteButton(
          actionText: 'Add folder',
          icon: Icons.create_new_folder_outlined,
          onPressed: vm.selectedNotesList.isNotEmpty ? () {} : null,
        ),
      ];

  Widget get _notesActionButtonListBuilder => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 16),
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: vm.selectedNotesList.observer(
          (context, value) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _noteActionsButtonList,
            ),
          ),
        ),
      );

  Widget get _foldersListBuilder => SingleChildScrollView(
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            padding: const EdgeInsets.all(14),
            child: Center(
              child: Text(
                'Folder $index',
                style: AppTextTheme.textXl(weight: TextWeight.medium),
              ),
            ),
          ),
          itemCount: 14,
        ),
      );

  Widget get _actionsBottomSheetBuilder => BottomSheet(
        animationController: BottomSheet.createAnimationController(this),
        onClosing: () {},
        builder: (context) => Scaffold(
          bottomNavigationBar: _notesActionButtonListBuilder,
          body: _foldersListBuilder,
        ),
      );

  Widget get _notesLoadingIndicatorBuilder => Container(
        constraints: BoxConstraints(
            minHeight: vm.notesList.isEmpty
                ? MediaQuery.of(context).size.height - 300
                : 0),
        child: ResponseBlocBuidler(
          bloc: vm.notesBloc,
          emptyResponseText: 'All notes are loaded!',
          epmtyListText:
              'You don\'t have any notes. Add them and they will appear here.',
        ),
      );

  Widget get _notesListBuilder => Obs(
        rvList: [
          vm.notesList,
          vm.isLoading,
          vm.isSelectNotesMode,
          vm.selectedNotesList
        ],
        builder: (context) => ReorderableListView.builder(
          footer: _notesLoadingIndicatorBuilder,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onNoteDrag(oldIndex, newIndex),
          itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
            enabled: !vm.isLoading.value ^ vm.isSelectNotesMode.value,
            key: ObjectKey(vm.notesList[index]),
            index: index,
            child: SelectableContainer(
              isSelectedMode: vm.isSelectNotesMode.value,
              thisItemIsSelected:
                  vm.checkDelteNotesListContainsNote(vm.notesList[index].id),
              child: NoteWithContentWidget(
                onPressed: () =>
                    vm.onPressedNote(context: context, index: index),
                note: vm.notesList[index],
              ),
            ),
          ),
          itemCount: vm.notesList.length,
        ),
      );

  Widget get _selectionModeButtonBuilder =>
      vm.isSelectNotesMode.observer((context, value) => SelectionModeButton(
          isSelectedMode: value, onPressed: vm.onPressedSelectionModeButton));

  Widget get _actionButtonBuilder => vm.selectedNotesList.observer(
        (context, value) => AppElevatedButton(
          mini: true,
          onPressed: value.isNotEmpty ? _showActionsBottomSheet : null,
          child: const Icon(Icons.more_vert_sharp),
        ),
      );

  Widget get _refreshNotesButtonBuilder => Obs(
        rvList: [vm.isSelectNotesMode, vm.isLoading],
        builder: (context) => AnimatedVisibility(
          visible: !DeviceInfo.checkIsTouchDevice(context),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: RefreshButton(
              onPressed: vm.isSelectNotesMode.value || vm.isLoading.value
                  ? null
                  : vm.refreshNotes,
            ),
          ),
        ),
      );

  Widget get _selectedNotesCountBuilder => vm.isSelectNotesMode.observer(
        (context, value) => AnimatedVisibility(
          visible: value,
          child: Obs(
            rvList: [vm.selectedNotesList, vm.isSelectNotesMode],
            builder: (context) => Container(
              width: 44,
              margin: const EdgeInsets.only(right: 10),
              child: CounterWidget(
                style: AppTextTheme.textBase(
                    weight: TextWeight.medium,
                    color: Theme.of(context).colorScheme.primary),
                count: vm.selectedNotesList.length,
              ),
            ),
          ),
        ),
      );
  Widget get _selectAllNotesButtonBuilder => Obs(
        rvList: [vm.isSelectNotesMode, vm.allNotesIsSelected, vm.notesList],
        builder: (context) => Container(
          margin: const EdgeInsets.only(right: 10),
          child: SelectAllButton(
            listIsSelected: vm.allNotesIsSelected.value,
            onPressed: vm.notesList.isNotEmpty && vm.isSelectNotesMode.value
                ? vm.onPressedSelectAllNotes
                : null,
          ),
        ),
      );

  Widget get _searchButtonBuilder => SearchButton(
        onPressed: () => context.push(AppRoutes.notesSearchPage),
      );

  Widget get _selectedListActionButtonsBuilder => Flexible(
        child: vm.isSelectNotesMode.observer(
          (context, value) => AnimatedVisibility(
            visible: value,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 44),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
              ),
              clipBehavior: Clip.antiAlias,
              child: ScrollableRow(
                children: [
                  _selectAllNotesButtonBuilder,
                  _actionButtonBuilder,
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      );
  Future<void> _showFiltersBottomSheet() async {
    final bool includingCatalogs = vm.includingCatalogs.value;
    await showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (context) => _filtersBottomSheetBuilder,
    );
    if (includingCatalogs != vm.includingCatalogs.value) {
      vm.notesList.clear();
      vm.notesBloc.add(ResponseBlocEvent.loading());
      vm.getNotes();
    }
  }

  Widget get _filtersBottomSheetBuilder => Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppLogoAnimated(
              repeat: false,
            ),
            const SizedBox(height: 20),
            vm.includingCatalogs.observer(
              (context, include) => SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Notes from other catalogs',
                  style: AppTextTheme.textBase(weight: TextWeight.medium),
                ),
                value: include,
                onChanged: (value) => vm.includingCatalogs(!include),
              ),
            )
          ],
        ),
      );

  Widget get _filterButtonBuilder => AppElevatedButton(
        isAsyncButton: false,
        mini: true,
        onPressed: _showFiltersBottomSheet,
        child: const Icon(Icons.filter_alt_outlined),
      );

  PreferredSizeWidget get _bottomAppBarBuilder => AppBar(
        toolbarHeight: 68,
        forceMaterialTransparency: true,
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

  SliverAppBar get _appBarBuilder => SliverAppBar(
        toolbarHeight: 65,
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
                _refreshNotesButtonBuilder,
              ],
            ),
            Row(
              children: [
                _searchButtonBuilder,
                const SizedBox(width: 10),
                _filterButtonBuilder,
              ],
            )
          ],
        ),
        bottom: _bottomAppBarBuilder,
        pinned: true,
        snap: true,
        floating: true,
      );

  Widget get _floatingActionButtonBuilder => FloatingActionButton(
        onPressed: () => vm.addNote(context),
        child: Icon(
          Icons.add_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
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
      floatingActionButton: _floatingActionButtonBuilder,
      body: RefreshIndicator(
        key: vm.refreshIndicatorKey,
        onRefresh: vm.refreshNotes,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: vm.scrollController,
          slivers: [
            _appBarBuilder,
            SliverToBoxAdapter(
              child: _notesListBuilder,
            ),
          ],
        ),
      ),
    );
  }
}
