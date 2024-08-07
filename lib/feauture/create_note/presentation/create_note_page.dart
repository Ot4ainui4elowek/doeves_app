import 'dart:math';

import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/logo/app_logo_animated.dart';
import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_controller.dart';
import 'package:doeves_app/feauture/create_note/presentation/view_models/create_note_page_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/content_widget.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/tasks_list/tasks_list_widget.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/text_content_widget.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({
    super.key,
    required this.vm,
  });
  final CreateNotePageViewModel vm;

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  CreateNotePageViewModel get vm => widget.vm;
  CreateNotePageController get controller => vm.controller;
  Widget get _titleBuilder {
    final textStyle = AppTextTheme.text2Xl(weight: TextWeight.bold).copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Column(
      children: [
        const SizedBox(height: 24),
        ClearTextField(
          context: context,
          controller: controller.titleTextController,
          hintText: 'My New Idea!',
          textStyle: textStyle,
        ),
      ],
    );
  }

  Widget get _descriptionBuilder {
    final textStyle = AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
      color: Theme.of(context).colorScheme.outline,
    );
    return Column(
      children: [
        ClearTextField(
          context: context,
          controller: controller.descriptionTextController,
          hintText: "I'll do something...",
          textStyle: textStyle,
        ),
      ],
    );
  }

  // Widget get _contentListBuilder => controller.contentList.observer(
  //       (context, value) => ReorderableListView.builder(
  //         anchor: 0,
  //         buildDefaultDragHandles: false,
  //         onReorder: (oldIndex, newIndex) => controller.onContentDrag(
  //           oldIndex: oldIndex,
  //           newIndex: newIndex,
  //           context: context,
  //         ),
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         itemBuilder: (context, index) => ReorderableDragStartListener(
  //           enabled: false,
  //           key: ValueKey(value[index]),
  //           index: index,
  //           child: _ContentFactoryWidget(
  //             index: index,
  //             content: value[index],
  //             deleteContent: controller.deleteContent,
  //           ),
  //         ),
  //         itemCount: controller.contentList.length,
  //       ),
  //     );

  Widget _titleAndDescriptionBlocBuilder(Widget child) => Container(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height - 100),
        child: BlocBuilder(
          bloc: vm.controller.titleAndDescriptionBloc,
          builder: (context, state) =>
              vm.controller.titleAndDescriptionBloc.state.maybeWhen(
            orElse: () => const SizedBox(height: 0),
            initial: () => child,
            loading: () => Center(
              child: AppLogoAnimated(
                curve: Curves.linear,
                repeat: true,
                width: min(double.maxFinite, 200),
              ),
            ),
            error: (message) => Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.error,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTextTheme.textXl(weight: TextWeight.medium)
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _bodyBuilder => SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              _titleAndDescriptionBlocBuilder(
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _titleBuilder,
                      _descriptionBuilder,
                    ],
                  ),
                ),
              ),
              //_contentListBuilder,
              const SizedBox(height: 50),
            ],
          ),
        ),
      );

  // bool get checkNotesDataIsNotNull => widget.notesData != null;

  @override
  void initState() {
    vm.init();
    // vm.init(isEditedNote: checkNotesDataIsNotNull);
    // if (checkNotesDataIsNotNull) {
    //   vm.getNote(id: widget.notesData!.id, context: context);
    // }
    super.initState();
  }

  @override
  void dispose() {
    vm.dispose();
    //vm.dispose(isEditedNote: checkNotesDataIsNotNull);
    super.dispose();
  }

  Widget? get _addNoteButtonBuilder => FilledButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 22),
          ),
        ),
        onPressed: () => controller.createNote(),
        child: const Icon(Icons.check),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
      ),
      body: AppWrapper(
        maxWidth: 700,
        child: Scaffold(
          body: _bodyBuilder,
          bottomNavigationBar: const _BottomBar(
              // contentWidgetDatatList: controller.getAddContentList,
              ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: _addNoteButtonBuilder,
        ),
      ),
    );
  }
}

class _ContentFactoryWidget extends StatelessWidget {
  const _ContentFactoryWidget({
    required this.content,
    required this.deleteContent,
    required this.index,
  });
  final int index;
  final CreateContentEntity content;
  final void Function(int id) deleteContent;
  Widget contentBuilder() {
    switch (content) {
      case CreateTextContentImpl():
        {
          return TextContentWidget(content as CreateTextContentImpl);
        }
      case CreateTasksListImpl():
        {
          return TaskListContentWidget(content as CreateTasksListImpl);
        }
      default:
        return const SizedBox(height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContentWidget(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      index: index,
      key: ValueKey(content),
      contentBuilder: contentBuilder(),
      deleteContent: () => deleteContent(content.id),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar(
      {
      //required Map<CreateContentEnum, void Function()> contentWidgetDatatList,
      this.deleteNote});
  //   : _contentWidgetDatatList = contentWidgetDatatList;
  // final Map<CreateContentEnum, void Function()> _contentWidgetDatatList;
  final Future<void> Function()? deleteNote;

  // void _showNavigationBar(BuildContext context) {
  //   if (FocusScope.of(context).hasFocus) {
  //     FocusScope.of(context).unfocus();
  //   }
  //   showModalBottomSheet(
  //     showDragHandle: true,
  //     context: context,
  //     builder: (context) => Container(
  //       width: double.maxFinite,
  //       padding: const EdgeInsets.all(16).copyWith(top: 0),
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             ActionOnNoteButton(
  //               actionText: 'Add text',
  //               icon: Icons.text_fields_rounded,
  //               onPressed: _contentWidgetDatatList[CreateContentEnum.text],
  //             ),
  //             ActionOnNoteButton(
  //               actionText: 'Add task list',
  //               icon: Icons.list_rounded,
  //               onPressed: _contentWidgetDatatList[CreateContentEnum.taskList],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showDeleteDialogBuilder(BuildContext context) {
    if (deleteNote == null) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsPadding: const EdgeInsets.all(8),
        title: Text(
          'Do you want to delete the note?',
          style: AppTextTheme.textXl(weight: TextWeight.regular),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: context.pop,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Cancell',
                style:
                    AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              deleteNote!();
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Delete',
                style:
                    AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: BottomAppBar(
        padding: const EdgeInsets.only(
          left: 16,
          right: 88,
        ),
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Row(
          children: [
            // Container(
            //   margin: const EdgeInsets.only(right: 10),
            //   child: FloatingActionButton(
            //     onPressed: () => _showNavigationBar(context),
            //     heroTag: UniqueKey(),
            //     child: const Icon(Icons.add),
            //   ),
            // ),
            AnimatedVisibility(
              visible: deleteNote != null,
              child: FloatingActionButton(
                onPressed: () => _showDeleteDialogBuilder(context),
                heroTag: UniqueKey(),
                child: const Icon(Icons.delete_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
