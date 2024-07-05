import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/add_content_button_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_content_entity.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/create_text_content_impl.dart';
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
        (context, value) => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => _ContentWidget(
            content: value[index],
            deleteContent: vm.deleteContent,
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 25,
          ),
          itemCount: vm.contentList.length,
        ),
      );

  Widget get _bodyBuilder => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              _titleBuilder,
              _descriptionBuilder,
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

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    required this.content,
    required this.deleteContent,
  });
  final CreateContentEntity content;
  final void Function(int id) deleteContent;
  @override
  Widget build(BuildContext context) {
    switch (content) {
      case CreateTextContentImpl():
        {
          return _TextContentWidget(
            content: content as CreateTextContentImpl,
            deleteContent: deleteContent,
          );
        }
      default:
        return const SizedBox(height: 0);
    }
  }
}

class _TextContentWidget extends StatelessWidget {
  const _TextContentWidget({
    required this.content,
    required this.deleteContent,
  });

  final CreateTextContentImpl content;

  final void Function(int id) deleteContent;

  Widget _textBuilder(BuildContext context) {
    final textStyle =
        AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
      color: Theme.of(context).colorScheme.outline,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 56),
      child: TextField(
        maxLines: null,
        controller: content.controller,
        style: textStyle,
        decoration: InputDecoration(
          hintText: 'Note...',
          border: InputBorder.none,
          hintStyle: textStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _textBuilder(context),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              onPressed: () {
                deleteContent(content.id);
              },
              icon: const Icon(
                Icons.close_rounded,
              )),
        )
      ],
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
      // style: ButtonStyle(
      //   shape: WidgetStatePropertyAll(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(14),
      //     ),
      //   ),
      //   padding: const WidgetStatePropertyAll(
      //     EdgeInsets.symmetric(vertical: 26, horizontal: 16),
      //   ),
      // ),
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
