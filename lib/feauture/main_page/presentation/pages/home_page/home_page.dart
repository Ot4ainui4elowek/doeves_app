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

class _NotesHomePageState extends State<NotesHomePage> {
  NotesHomePageViewModel get vm => widget.vm;

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
                onPressed: () => vm.performActionOnNote(
                  id: vm.notes[index].id,
                  deleteNotesListContainNote:
                      vm.checkDelteNotesListContainsNote(vm.notes[index].id),
                ),
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

  SliverAppBar get _appBarBuilder => SliverAppBar(
        expandedHeight: 65,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        snap: true,
        floating: true,
        title: Obs(
          rvList: [vm.selectedNotesList, vm.isSelectNotesMode],
          builder: (context) => Visibility(
            visible: vm.isSelectNotesMode.value,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(22)),
              child: Text(
                'Selected: ${vm.selectedNotesList.length}',
                style: AppTextTheme.textBase(
                  weight: TextWeight.regular,
                ).copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
        ),
        actions: [
          vm.isSelectNotesMode.observer(
            (context, value) => Visibility(
              visible: value,
              maintainState: true,
              maintainAnimation: true,
              child: vm.selectedNotesList.observer(
                (context, value) => AppElevatedbuttonMini(
                  onPressed: value.isNotEmpty ? vm.deleteSomeNotes : null,
                  child: const Icon(Icons.delete_outline_outlined),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Visibility(
            visible: !vm.isTouchDevice(context),
            child: AppElevatedbuttonMini(
              onPressed: vm.refreshNotes,
              child: const Icon(Icons.refresh_outlined),
            ),
          ),
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
