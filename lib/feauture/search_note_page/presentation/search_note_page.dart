import 'package:doeves_app/core/presentation/hero_search_tf.dart';
import 'package:flutter/material.dart';

class SearchNotePage extends StatefulWidget {
  const SearchNotePage({super.key});

  @override
  State<SearchNotePage> createState() => _SearchNotePageState();
}

class _SearchNotePageState extends State<SearchNotePage> {
  late final focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    Future.delayed(const Duration(milliseconds: 350), () {
      // 350 was the least I could go
      focusNode.requestFocus();
    });
  }

// Dispose
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeroSearch(
          focusNode: focusNode,
        ),
      ),
    );
  }
}
