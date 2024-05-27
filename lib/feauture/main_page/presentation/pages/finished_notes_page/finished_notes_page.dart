import 'package:flutter/material.dart';

class FinishedNotesPage extends StatefulWidget {
  const FinishedNotesPage({super.key});

  @override
  State<FinishedNotesPage> createState() => _FinishedNotesPageState();
}

class _FinishedNotesPageState extends State<FinishedNotesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('finished'),
    );
  }
}
