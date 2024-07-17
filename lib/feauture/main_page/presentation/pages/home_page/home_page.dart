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
//MediaQuery.of(context).size.width >= 540
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

  Widget get _notesLoadingIndicatorBuilder => BlocBuilder(
        bloc: vm.notesBloc,
        builder: (context, state) => vm.notesBloc.state.maybeWhen(
          orElse: () => const SizedBox(height: 0),
          loadingNotes: () => Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: const AppLogoAnimated(curve: Curves.linear, repeat: true),
          ),
          emptyResult: () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
            child: Text(
              'All notes are loaded!',
              style: AppTextTheme.textXl(weight: TextWeight.medium),
            ),
          ),
          error: (error) => Text(error.code),
        ),
      );

  Widget get _notesListBuilder => Obs(
        rvList: [vm.notes, vm.isLoading],
        builder: (context) => ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onNoteDrag(oldIndex, newIndex),
          itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
            enabled: !vm.isLoading.value,
            key: ObjectKey(vm.notes[index]),
            index: index,
            child: NoteWithContentWidget(
              note: vm.notes[index],
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
    debugPrint(vm.isTouchDevice(context).toString());
    return Scaffold(
      floatingActionButton: _refreshPageButtonBuilder(),
      body: RefreshIndicator(
        key: vm.refreshIndicatorKey,
        onRefresh: vm.refreshNotes,
        child: Center(
          child: SingleChildScrollView(
            controller: vm.scrollController,
            child: Column(
              children: [
                _notesListBuilder,
                _notesLoadingIndicatorBuilder,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
