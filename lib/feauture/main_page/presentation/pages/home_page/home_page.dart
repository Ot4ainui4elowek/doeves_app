import 'package:doeves_app/feauture/main_page/presentation/pages/home_page/home_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:flutter/material.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key, required this.vm});
  final NotesHomePageViewModel vm;

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  NotesHomePageViewModel get vm => widget.vm;
  @override
  void initState() {
    vm.getNotes();
    vm.init();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    vm.getNotes();
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
    return vm.notes.observer(
      (context, value) => ReorderableListView.builder(
        scrollController: vm.scrollController,
        shrinkWrap: true,
        buildDefaultDragHandles: false,
        onReorder: (oldIndex, newIndex) => vm.onNoteDrag(oldIndex, newIndex),
        itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
          key: ValueKey(value[index].description),
          index: index,
          child: NoteWithContentWidget(
            note: value[index],
          ),
        ),

        //separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: value.length,
      ),
    );
  }
}
