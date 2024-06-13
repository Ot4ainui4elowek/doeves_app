import 'package:flutter/material.dart';

class CollectionsOfNotesPage extends StatefulWidget {
  const CollectionsOfNotesPage({super.key});

  @override
  State<CollectionsOfNotesPage> createState() => _CollectionsOfNotesPageState();
}

class _CollectionsOfNotesPageState extends State<CollectionsOfNotesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('collection'),
    );
  }
}
