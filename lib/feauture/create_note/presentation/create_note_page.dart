import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_text_icon_button.dart';
import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/add_content_button_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_vm.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/content_widget.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/tasks_list/tasks_list_widget.dart';
import 'package:doeves_app/feauture/create_note/presentation/widgets/text_content_widget.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key, required this.vm});
  final CreateNotePageViewModel vm;
  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  CreateNotePageViewModel get vm => widget.vm;
  Widget get _titleBuilder {
    final textStyle = AppTextTheme.text2Xl(weight: TextWeight.bold).copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Column(
      children: [
        const SizedBox(height: 24),
        ClearTextField(
          context: context,
          controller: AppTextEditingController(),
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
          controller: AppTextEditingController(),
          hintText: "I'll do something...",
          textStyle: textStyle,
        ),
      ],
    );
  }

  Widget get _contentListBuilder => vm.contentList.observer(
        (context, value) => ReorderableListView.builder(
          anchor: 0,
          buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onContentDrag(
            oldIndex: oldIndex,
            newIndex: newIndex,
            context: context,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ReorderableDragStartListener(
            enabled: false,
            key: ValueKey(value[index]),
            index: index,
            child: _ContentFactoryWidget(
              index: index,
              content: value[index],
              deleteContent: vm.deleteContent,
            ),
          ),
          itemCount: vm.contentList.length,
        ),
      );

  Widget get _bodyBuilder => SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _titleBuilder,
                    _descriptionBuilder,
                  ],
                ),
              ),
              _contentListBuilder,
              const SizedBox(height: 50),
            ],
          ),
        ),
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
          bottomNavigationBar: _BottomBar(vm.contentWidgetDatatList),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            hoverElevation: 0,
            shape: const CircleBorder(),
            onPressed: () => context.go(AppRoutes.notesHomePage),
            child: const Icon(Icons.check),
          ),
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
  const _BottomBar(this._contentWidgetDatatList);
  final List<AddContentButtonWidgetEntity> _contentWidgetDatatList;

  void _showNavigationBar(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              _AddContentButtonWidget(_contentWidgetDatatList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: _contentWidgetDatatList.length,
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => _showNavigationBar(context),
              heroTag: 'create new note button',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddContentButtonWidget extends StatelessWidget {
  const _AddContentButtonWidget(this.content);
  final AddContentButtonWidgetEntity content;
  @override
  Widget build(BuildContext context) {
    return AppTextIconButton(
      onPressed: content.canPopOnTap
          ? () {
              content.onPressed();
              context.pop();
            }
          : content.onPressed,
      icon: Icon(
        content.icon,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      text: Text(
        content.title,
        style: AppTextTheme.textBase(
          weight: TextWeight.medium,
        ).copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
    );
  }
}
