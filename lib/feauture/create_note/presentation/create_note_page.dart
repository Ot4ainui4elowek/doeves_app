import 'package:doeves_app/core/presentation/app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/text_fields/controllers/app_text_editing_controller.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
      ),
      body: AppWrapper(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _titleBuilder,
                  _descriptionBuilder,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
