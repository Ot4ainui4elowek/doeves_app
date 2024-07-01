import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content_widget_entity.dart';
import 'package:doeves_app/feauture/create_note/presentation/create_note_page_vm.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

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
  Widget get _descriptionBuilder => Column(
        children: [
          TextField(
            maxLines: null,
            controller: AppTextEditingController(),
            style: AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            decoration: InputDecoration(
              hintText: "I'll do something...",
              border: InputBorder.none,
              hintStyle:
                  AppTextTheme.textBase(weight: TextWeight.regular).copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
        ],
      );
  Widget get _bottomNavigationBarBuilder => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomAppBar(
          padding: const EdgeInsets.only(left: 16, right: 88),
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(16).copyWith(top: 0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            _AddContentWidget(vm.contentWidgetDatatList[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: vm.contentWidgetDatatList.length,
                      ),
                    ),
                  );
                },
                heroTag: 'add button',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      );

  Widget get _bodyBuilder => SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              _titleBuilder,
              _descriptionBuilder,
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
          bottomNavigationBar: _bottomNavigationBarBuilder,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Icon(Icons.check),
          ),
        ),
      ),
    );
  }
}

class _AddContentWidget extends StatelessWidget {
  const _AddContentWidget(this.content);
  final ContentWidgetEntity content;
  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      onPressed: content.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(content.icon),
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
