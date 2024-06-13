import 'package:flutter/material.dart';

class CompletedNotesPage extends StatefulWidget {
  const CompletedNotesPage({super.key});

  @override
  State<CompletedNotesPage> createState() => _CompletedNotesPageState();
}

class _CompletedNotesPageState extends State<CompletedNotesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('completed'),
    );
  }
}
