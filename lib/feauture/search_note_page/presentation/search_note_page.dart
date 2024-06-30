import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_bar_button.dart';
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
        AppBarButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.surfaceContainer),
          ),
          child: const Icon(
            Icons.filter_alt_outlined,
          ),
        ),
        const SizedBox(width: 16),
      ];

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      maxWidth: 700,
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
