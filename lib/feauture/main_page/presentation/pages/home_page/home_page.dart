import 'package:doeves_app/core/presentation/buttons/app_bar_button.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
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
  Widget? _refreshPageButtonBuilder() {
    if (!vm.isTouchDevice(context)) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(45), topLeft: Radius.circular(45)),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: AppElevatedButton(
          width: 75,
          onPressed: vm.refreshNotes,
          child: Icon(
            Icons.refresh_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    }
    return null;
  }

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
          vm.isDeleteNotesMode,
          vm.deleteNotesList
        ],
        builder: (context) => ReorderableListView.builder(
          footer: _notesLoadingIndicatorBuilder,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onNoteDrag(oldIndex, newIndex),
          itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
            enabled: !vm.isLoading.value ^ vm.isDeleteNotesMode.value,
            key: ObjectKey(vm.notes[index]),
            index: index,
            child: NoteWithContentWidget(
              unSelectNode: () => vm.deleteNotesList
                  .removeWhere((id) => id == vm.notes[index].id),
              selectNode: () => vm.deleteNotesList.add(vm.notes[index].id),
              note: vm.notes[index],
              isDeleteNotesMode: vm.isDeleteNotesMode.value,
              isSelected: vm.deleteNotesList.value.contains(vm.notes[index].id),
            ),
          ),
          itemCount: vm.notes.length,
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
      floatingActionButton: _refreshPageButtonBuilder(),
      body: RefreshIndicator(
        key: vm.refreshIndicatorKey,
        onRefresh: vm.refreshNotes,
        child: Center(
          child: CustomScrollView(
            controller: vm.scrollController,
            slivers: [
              SliverAppBar(
                toolbarHeight: 68,
                backgroundColor: Theme.of(context).colorScheme.surface,
                surfaceTintColor: Colors.transparent,
                //forceMaterialTransparency: true,
                snap: true,
                floating: true,
                actions: [
                  AppBarButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.surfaceContainer)),
                      onPressed: () {
                        if (vm.isDeleteNotesMode.value) {
                          vm.deleteNotesList.clear();
                        }
                        vm.isDeleteNotesMode(!vm.isDeleteNotesMode.value);
                      },
                      child: const Icon(Icons.control_point_duplicate_sharp)),
                  const SizedBox(width: 16),
                ],
              ),
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
