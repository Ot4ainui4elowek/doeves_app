import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_divider.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/add_content_button_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/create_task_list_impl.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/tasks_list/task_list_item.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_vm.dart';
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
  Widget get _titleBuilder => Column(
        children: [
          const SizedBox(height: 24),
          TextField(
            maxLines: null,
            controller: AppTextEditingController(),
            style: AppTextTheme.text2Xl(weight: TextWeight.bold),
            decoration: InputDecoration(
              hintText: 'My New Idea!',
              border: InputBorder.none,
              hintStyle: AppTextTheme.text2Xl(weight: TextWeight.bold).copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      );
  Widget get _descriptionBuilder {
    final textStyle = AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
      color: Theme.of(context).colorScheme.outline,
    );
    return Column(
      children: [
        TextField(
          maxLines: null,
          controller: AppTextEditingController(),
          style: textStyle,
          decoration: InputDecoration(
            hintText: "I'll do something...",
            border: InputBorder.none,
            hintStyle: textStyle,
          ),
        ),
      ],
    );
  }

  Widget get _contentListBuilder => vm.contentList.observer(
        (context, value) => ReorderableListView.builder(
          //buildDefaultDragHandles: false,
          onReorder: (oldIndex, newIndex) => vm.onContentDrag(
            oldIndex: oldIndex,
            newIndex: newIndex,
            context: context,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _ContentFactoryWidget(
            key: ValueKey(value[index]),
            content: value[index],
            deleteContent: vm.deleteContent,
          ),
          // separatorBuilder: (context, index) => AppDivider(
          //   context: context,
          //   height: 25,
          // ),
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
            onPressed: () {},
            child: const Icon(Icons.check),
          ),
        ),
      ),
    );
  }
}

class _ContentFactoryWidget extends StatelessWidget {
  const _ContentFactoryWidget({
    super.key,
    required this.content,
    required this.deleteContent,
  });
  final CreateContentEntity content;
  final void Function(int id) deleteContent;
  Widget contentBuilder() {
    switch (content) {
      case CreateTextContentImpl():
        {
          return _TextContentWidget(content as CreateTextContentImpl);
        }
      case CreateTasksListImpl():
        {
          return _TaskListContentWidget(content as CreateTasksListImpl);
        }
      default:
        return const SizedBox(height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ContentWidget(
      key: ValueKey(content),
      contentBuilder: contentBuilder(),
      deleteContent: deleteContent,
      id: content.id,
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    super.key,
    required this.contentBuilder,
    required this.deleteContent,
    required this.id,
  });
  final Widget contentBuilder;
  final int id;
  final void Function(int id) deleteContent;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        deleteContent(id);
      },
      key: ValueKey(id),
      background: Container(
        key: ValueKey(id),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: contentBuilder,
            ),
            // Positioned(
            //   top: 10,
            //   right: 10,
            //   child: Icon(Icons.drag_indicator_outlined,
            //       color: Theme.of(context).colorScheme.outline),
            // )
          ],
        ),
      ),
    );
  }
}

class _TaskListContentWidget extends StatelessWidget {
  const _TaskListContentWidget(this.tasksList);
  final CreateTasksListImpl tasksList;

  Widget _taskBuilder(int index) {
    return Obs(
      rvList: [tasksList[index].isSuccess],
      builder: (context) => CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: _ContentTextField(controller: tasksList[index].text),
        value: tasksList[index].isSuccess.value,
        onChanged: (switchValue) {
          tasksList[index].isSuccess(!tasksList[index].isSuccess.value);
          switchValue = tasksList[index].isSuccess.value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContentTextField(
          controller: tasksList.listTitle,
          hint: 'This is a list of something...',
          style: AppTextTheme.textBase(weight: TextWeight.medium).copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        tasksList.observer(
          (context, value) => ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => _taskBuilder(index),
            separatorBuilder: (context, index) => AppDivider(
              height: 25,
              context: context,
            ),
            itemCount: value.length,
          ),
        ),
        AppDivider(
          context: context,
          height: 25,
        ),
        OutlinedButton(
            onPressed: () {
              tasksList.add(TaskListItem());
            },
            style: ButtonStyle(
                shape: const WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                ),
                side: WidgetStatePropertyAll(
                    BorderSide(color: Theme.of(context).colorScheme.outline)),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.add,
                ),
                Text(
                  'Add task',
                  style: AppTextTheme.textBase(weight: TextWeight.medium),
                ),
                const SizedBox(height: 0),
              ],
            ))
      ],
    );
  }
}

class _TextContentWidget extends StatelessWidget {
  const _TextContentWidget(this.content);

  final CreateTextContentImpl content;

  @override
  Widget build(BuildContext context) {
    return _ContentTextField(
      controller: content.controller,
    );
  }
}

class _ContentTextField extends StatelessWidget {
  const _ContentTextField({
    required this.controller,
    this.style,
    this.hint = 'Some text...',
  });
  final AppTextEditingController controller;
  final String hint;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    final textStyle =
        AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
      color: Theme.of(context).colorScheme.outline,
    );
    return TextField(
      maxLines: null,
      controller: controller,
      style: style ?? textStyle,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        hintStyle: style ?? textStyle,
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar(this._contentWidgetDatatList);
  final List<AddContentButtonWidgetEntity> _contentWidgetDatatList;

  void _showNavigationBar(BuildContext context) {
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
    return AppElevatedButton(
      onPressed: content.canPopOnTap
          ? () {
              content.onPressed();
              context.pop();
            }
          : content.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            content.icon,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          Text(
            content.title,
            style: AppTextTheme.textBase(
              weight: TextWeight.medium,
            ).copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }
}
