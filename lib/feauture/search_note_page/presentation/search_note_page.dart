import 'package:doeves_app/core/presentation/app_bars/custom_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_bar_button.dart';
import 'package:doeves_app/core/presentation/hero_widgets/hero_search_widget.dart';
import 'package:doeves_app/feauture/search_note_page/presentation/search_note_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class SearchNotePage extends StatefulWidget {
  const SearchNotePage({super.key, required this.vm});
  final SearchNotePageViewModel vm;

  @override
  State<SearchNotePage> createState() => _SearchNotePageState();
}

class _SearchNotePageState extends State<SearchNotePage> {
  SearchNotePageViewModel get vm => widget.vm;
  @override
  void initState() {
    super.initState();
    vm.init();
  }

// Dispose
  @override
  void dispose() {
    vm.dispose();
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

  Widget get _searchBarBuilder => Expanded(
        child: SearchTextField(
          focusNode: vm.focusNode,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      maxWidth: 700,
      child: Obs(
        rvList: [vm.searchBarIsSelected],
        builder: (context) => Scaffold(
          appBar: CustomAppBar(
            isSelected: vm.searchBarIsSelected.value,
            context: context,
            titleWidget: _searchBarBuilder,
            actions: _actionsBuilder,
          ),
        ),
      ),
    );
  }
}
