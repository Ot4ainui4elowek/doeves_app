import 'package:doeves_app/feauture/main_page/presentation/pages/folders_with_notes_page/folders_with_notes_page_vm.dart';
import 'package:flutter/material.dart';

class FolderWithNotesPage extends StatefulWidget {
  const FolderWithNotesPage({super.key, required this.vm});

  final FoldersWithNotesPageVm vm;

  @override
  State<FolderWithNotesPage> createState() => _FolderWithNotesPageState();
}

class _FolderWithNotesPageState extends State<FolderWithNotesPage> {
  FoldersWithNotesPageVm get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('folders'));
  }
}
