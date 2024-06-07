import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:flutter/material.dart';

class SearchNotePage extends StatefulWidget {
  const SearchNotePage({super.key});

  @override
  State<SearchNotePage> createState() => _SearchNotePageState();
}

class _SearchNotePageState extends State<SearchNotePage> {
  late final FocusNode focusNode;
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

  List<Widget> get _actionsBuilder => [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_outlined),
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.surfaceContainer),
          ),
        ),
        const SizedBox(width: 16),
      ];

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          titleWidget: HeroSearchWidget(
            focusNode: focusNode,
          ),
          actions: _actionsBuilder,
        ),
      ),
    );
  }
}
