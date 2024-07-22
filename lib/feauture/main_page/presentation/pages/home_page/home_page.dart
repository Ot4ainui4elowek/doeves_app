import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevatedButton_mini.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/draggable_selectable_container.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
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

  Widget get _actionsBottomSheetBuilder => BottomSheet(
        animationController: BottomSheet.createAnimationController(this),
        onClosing: () {},
        builder: (context) => Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 0),
              SizedBox(
                height: 116,
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, inedx) =>
                      const SizedBox(width: 10),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _notesLoadingIndicatorBuilder => Center(
        child: BlocBuilder(
          bloc: vm.notesBloc,
          builder: (context, state) => vm.notesBloc.state.maybeWhen(
            orElse: () => const SizedBox(height: 0),
            loadingNotes: () => Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: const AppLogoAnimated(curve: Curves.linear, repeat: true),
            ),
            emptyResult: () => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: Text(
                'All notes are loaded!',
                style: AppTextTheme.textXl(weight: TextWeight.medium),
              ),
            ),
            error: (error) => Text(error.code),
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
            child: DraggableSelectableContainer(
              deleteModeEnabled: vm.isSelectNotesMode.value,
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

  Widget get _selectNoteButtonBuilder => vm.isSelectNotesMode.observer(
        (context, value) => AppElevatedbuttonMini(
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
            (context, value) => AppElevatedbuttonMini(
              onPressed: value.isNotEmpty ? _showActionsBottomSheet : null,
              child: const Icon(Icons.more_vert_sharp),
            ),
          ),
        ),
      );

  SliverAppBar get _appBarBuilder => SliverAppBar(
        expandedHeight: 65,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        snap: true,
        floating: true,
        title: vm.isSelectNotesMode.observer(
          (context, value) => AnimatedVisibility(
            visible: !vm.isTouchDevice(context) && !value,
            child: AppElevatedbuttonMini(
              onPressed: value ? null : vm.refreshNotes,
              child: const Icon(Icons.refresh_outlined),
            ),
          ),
        ),
        actions: [
          Obs(
            rvList: [vm.selectedNotesList, vm.isSelectNotesMode],
            builder: (context) => AnimatedVisibility(
              visible: vm.isSelectNotesMode.value,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(22)),
                child: Center(
                  child: Text(
                    vm.selectedNotesList.length.toString(),
                    style: AppTextTheme.textBase(
                      weight: TextWeight.medium,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _actionButtonBuilder,
          const SizedBox(width: 10),
          _selectNoteButtonBuilder,
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
