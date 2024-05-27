import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/feauture/main_page/presentation/pages/select_new_note_page.dart/create_note_button_list_item.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectNewNotePage extends StatefulWidget {
  const SelectNewNotePage({super.key});

  @override
  State<SelectNewNotePage> createState() => _SelectNewNotePageState();
}

class _SelectNewNotePageState extends State<SelectNewNotePage> {
  PreferredSizeWidget get appBarBuilder => AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 76,
        centerTitle: true,
        leading: context.canPop()
            ? Container(
                margin: const EdgeInsets.only(left: 16),
                child: TextButton(
                  onPressed: context.pop,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        'Back',
                        style: AppTextTheme.textBase(weight: TextWeight.medium)
                            .copyWith(
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              )
            : null,
        title: Text(
          'New Notes',
          style: AppTextTheme.textBase(weight: TextWeight.medium),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder,
      body: SingleChildScrollView(
        child: AppWrapper(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'What Do You Want to Notes?',
                style: AppTextTheme.text2Xl(weight: TextWeight.bold),
              ),
              const SizedBox(height: 32),
              CreateNoteButtonListItem(
                description: 'Some descr',
                icon: Icons.lightbulb,
                onPressed: () {},
                title: 'SimpleNote',
              ),
            ],
          ),
        )),
      ),
    );
  }
}
