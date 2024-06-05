import 'package:doeves_app/feauture/home_page/presentation/widgets/add_note_button/add_note_button.dart';
import 'package:flutter/material.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('home page'),
      floatingActionButton: AddNoteButton(),
    );
  }
}
