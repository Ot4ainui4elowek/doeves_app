import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/counter_widget.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/action_on_note_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/select_all_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_variables/reactive_variables.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key, required this.vm});
  final NotesHomePageViewModel vm;

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
              ? () async => vm.deleteSomeNotes(context)
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

  Widget get _notesLoadingIndicatorBuilder => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: BlocBuilder(
            bloc: vm.notesBloc,
            builder: (context, state) => vm.notesBloc.state.maybeWhen(
              orElse: () => const SizedBox(height: 0),
              initial: () => Text(
                'You don\'t have any notes. Add them and they will appear here.',
                style: AppTextTheme.textXl(weight: TextWeight.medium),
              ),
              loading: () =>
                  const AppLogoAnimated(curve: Curves.linear, repeat: true),
              emptyResponse: () => Text(
                'All notes are loaded!',
                style: AppTextTheme.textXl(weight: TextWeight.medium),
              ),
              error: (error) => Column(
                children: [
                  const SizedBox(height: 150),
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                    size: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    error.code,
                    style: AppTextTheme.textXl(weight: TextWeight.medium)
                        .copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget get _notesListBuilder => Obs(
        rvList: [
          vm.notes,
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
            key: ObjectKey(vm.notes[index]),
            index: index,
            child: SelectableContainer(
              isSelectedMode: vm.isSelectNotesMode.value,
              thisItemIsSelected:
                  vm.checkDelteNotesListContainsNote(vm.notes[index].id),
              child: NoteWithContentWidget(
                onPressed: vm.isSelectNotesMode.value
                    ? () => vm.performActionOnNote(
                          id: vm.notes[index].id,
                          deleteNotesListContainNote:
                              vm.checkDelteNotesListContainsNote(
                                  vm.notes[index].id),
                        )
                    : null,
                note: vm.notes[index],
              ),
            ),
          ),
          itemCount: vm.notes.length,
        ),
      );

  Widget get _selectionModeButtonBuilder => vm.isSelectNotesMode.observer(
        (context, value) => AppElevatedButton(
          mini: true,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.surfaceContainer),
            side: WidgetStatePropertyAll(
              BorderSide(
                color: value
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
              ),
            ),
          ),
          onPressed: () {
            if (value) {
              vm.selectedNotesList.clear();
            }
            vm.isSelectNotesMode(!value);
          },
          child: const Icon(Icons.control_point_duplicate_sharp),
        ),
      );

  Widget get _actionButtonBuilder => vm.isSelectNotesMode.observer(
        (context, value) => AnimatedVisibility(
          visible: value,
          child: vm.selectedNotesList.observer(
            (context, value) => AppElevatedButton(
              mini: true,
              onPressed: value.isNotEmpty ? _showActionsBottomSheet : null,
              child: const Icon(Icons.more_vert_sharp),
            ),
          ),
        ),
      );

  Widget get _refreshNotesButtonBuilder => Obs(
        rvList: [vm.isSelectNotesMode, vm.isLoading],
        builder: (context) => AnimatedVisibility(
            visible: !DeviceParams.checkIsTouchDevice(context) &&
                !vm.isSelectNotesMode.value,
            child: RefreshButton(
              onPressed: vm.isSelectNotesMode.value || vm.isLoading.value
                  ? null
                  : vm.refreshNotes,
            )),
      );

  Widget get _selectedNotesCountBuilder => Obs(
        rvList: [vm.selectedNotesList, vm.isSelectNotesMode],
        builder: (context) => Container(
          margin: const EdgeInsets.only(right: 10),
          child: AnimatedVisibility(
            visible: vm.isSelectNotesMode.value,
            child: CounterWidget(
              count: vm.selectedNotesList.length,
            ),
          ),
        ),
      );

  Widget get _selectAllNotesButtonBuilder => Obs(
        rvList: [vm.isSelectNotesMode, vm.allNotesIsSelected, vm.notes],
        builder: (context) => AnimatedVisibility(
            visible: vm.isSelectNotesMode.value,
            child: SelectAllButton(
              listIsSelected: vm.allNotesIsSelected.value,
              onPressed: vm.onPressedSelectAllNotes,
            )),
      );

  SliverAppBar get _appBarBuilder => SliverAppBar(
        expandedHeight: 65,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        snap: true,
        floating: true,
        title: _refreshNotesButtonBuilder,
        actions: [
          _selectedNotesCountBuilder,
          _actionButtonBuilder,
          const SizedBox(width: 10),
          _selectAllNotesButtonBuilder,
          const SizedBox(width: 10),
          _selectionModeButtonBuilder,
          const SizedBox(width: 16),
        ],
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
        key: vm.refreshIndicatorKey,
        onRefresh: vm.refreshNotes,
        child: Center(
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
      ),
    );
  }
}
