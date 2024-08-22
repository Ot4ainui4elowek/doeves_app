import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CreateCatalogPage extends StatefulWidget {
  const CreateCatalogPage({
    super.key,
    required this.vm,
  });
  final CreateCatalogPageViewModel vm;

  @override
  State<CreateCatalogPage> createState() => _CreateCatalogPageState();
}

class _CreateCatalogPageState extends State<CreateCatalogPage> {
  CreateCatalogPageViewModel get vm => widget.vm;

  CreateCatalogPageController get controller => vm.controller;

  Widget get _catalogNameBuilder => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              ClearTextField(
                controller: controller.catalognameController,
                context: context,
                hintText: 'Catalog name',
                textStyle: AppTextTheme.text2Xl(
                  weight: TextWeight.bold,
                ).copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    vm.init();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    vm.init();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
      ),
      body: AppWrapper(
        maxWidth: 700,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            _catalogNameBuilder,
            SliverToBoxAdapter(
              child: controller.notesList.observer(
                (context, value) => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SelectableContainer(
                    isSelectedMode: false,
                    thisItemIsSelected: false,
                    child: NoteWithContentWidget(
                        note: value[index], onPressed: () {}),
                  ),
                  itemCount: value.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
