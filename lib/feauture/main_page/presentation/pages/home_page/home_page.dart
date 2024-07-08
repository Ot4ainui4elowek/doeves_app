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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: vm.notes.observer(
        (context, value) => ReorderableListView.builder(
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onNoteDrag(oldIndex, newIndex),
          itemBuilder: (context, index) => ReorderableDragStartListener(
            key: ValueKey(index * value[index].description.length),
            index: index,
            child: NoteWithContentWidget(
              note: value[index],
            ),
          ),

          //separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: value.length,
        ),
      ),
    );
  }
}
