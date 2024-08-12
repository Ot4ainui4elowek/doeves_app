import 'package:doeves_app/feauture/main_page/presentation/pages/catalogs_with_notes_page/catalogs_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/refresh_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:flutter/material.dart';

class CatalogsPage extends StatefulWidget {
  const CatalogsPage({super.key, required this.vm});

  final CatalogsPageViewModel vm;

  @override
  State<CatalogsPage> createState() => _CatalogsPageState();
}

class _CatalogsPageState extends State<CatalogsPage> {
  CatalogsPageViewModel get vm => widget.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: RefreshButton(
            onPressed: () {},
          ),
          actions: [
            vm.isSelectedMode.observer((context, value) => SelectionModeButton(
                  isSelectedMode: vm.isSelectedMode.value,
                  onPressed: () => vm.isSelectedMode(!value),
                )),
            const SizedBox(width: 16),
          ],
        )
      ],
    ));
  }
}
