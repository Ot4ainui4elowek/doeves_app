import 'dart:developer';

import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/bloc_builders/list_response_bloc_buidler.dart';
import 'package:doeves_app/core/presentation/buttons/back_button.dart';
import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/core/presentation/ui/app_wrapper.dart';
import 'package:doeves_app/core/presentation/ui/close_screen_handler.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/create_catalog_page_controller.dart';
import 'package:doeves_app/feauture/create_catalog_page/presentation/view_models/create_catalog_page_vm.dart';
import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/notes/note_with_content_widget.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCatalogPage extends StatefulWidget {
  CreateCatalogPage({
    super.key,
    required this.vm,
  }) {
    handler = CloseScreenHandler(vm);
  }
  final CreateCatalogPageViewModel vm;

  late final CloseScreenHandler<CatalogResponseModel> handler;

  @override
  State<CreateCatalogPage> createState() => _CreateCatalogPageState();
}

class _CreateCatalogPageState extends State<CreateCatalogPage> {
  CreateCatalogPageViewModel get vm => widget.vm;

  CreateCatalogPageController get controller => vm.controller;

  CloseScreenHandler<CatalogResponseModel> get screenHandler => widget.handler;

  SliverToBoxAdapter get _catalogNameBuilder => SliverToBoxAdapter(
        child: BlocBuilder(
          builder: (context, state) => controller.notesBloc.state.maybeWhen(
            orElse: () => Padding(
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
            error: (error) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ErrorWidget(error.code),
            ),
          ),
          bloc: controller.notesBloc,
        ),
      );

  Widget get _notesBlocBuilder => controller.notesList.observer(
        (context, value) => ConstrainedBox(
          constraints: BoxConstraints(
              minHeight:
                  value.isEmpty ? MediaQuery.of(context).size.height - 300 : 0),
          child: ListResponseBlocBuidler(
            bloc: controller.notesBloc,
            emptyResponseText: 'All notes are loaded!',
            epmtyListText:
                'You don\'t have any notes. Add them and they will appear here.',
          ),
        ),
      );

  Widget get _notesListBuilder => controller.notesList.observer(
        (context, value) => ReorderableListView.builder(
          footer: _notesBlocBuilder,
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) {},
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
            key: ObjectKey(value[index]),
            index: index,
            child: SelectableContainer(
              isSelectedMode: false,
              thisItemIsSelected: false,
              child: NoteWithContentWidget(
                  note: value[index],
                  onPressed: () => controller.onPressedNote(
                      context: context, note: value[index])),
            ),
          ),
          itemCount: value.length,
        ),
      );

  Widget get _floatingActionButtonBuilder => controller.catalogId.observer(
        (context, value) => value != -1
            ? FloatingActionButton(
                heroTag: 'create note in catalog',
                onPressed: () =>
                    controller.createNote(context: context, id: value),
                child: Icon(Icons.add_outlined,
                    color: Theme.of(context).colorScheme.onPrimary),
              )
            : const SizedBox(height: 0),
      );

  Widget get _leadingBuilder => controller.catalogId.observer(
        (context, id) => CustomBackButton(
          onPressed: id != -1
              ? () {
                  log(id.toString());
                  screenHandler.back(
                      context: context,
                      editData: CatalogResponseModel(
                          id: id,
                          name: controller.catalognameController.text.trim()));
                }
              : null,
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: TitleAppBar(
          context: context,
          customLeading: _leadingBuilder,
        ),
        body: AppWrapper(
          maxWidth: 700,
          child: Scaffold(
            floatingActionButton: _floatingActionButtonBuilder,
            body: controller.catalogId.observer(
              (context, value) => RefreshIndicator(
                onRefresh: () async => await controller.refreshNotes(value),
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    _catalogNameBuilder,
                    SliverToBoxAdapter(
                      child: _notesListBuilder,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
