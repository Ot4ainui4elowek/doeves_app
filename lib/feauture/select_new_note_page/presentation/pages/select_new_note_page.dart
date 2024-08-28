import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/ui/app_wrapper.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/pages/select_new_note_page_vm.dart';
import 'package:doeves_app/feauture/select_new_note_page/presentation/widgets/create_note_button_list_item.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class SelectNewNotePage extends StatefulWidget {
  const SelectNewNotePage({super.key, required this.vm});
  final SelectNewNotePageViewModel vm;

  @override
  State<SelectNewNotePage> createState() => _SelectNewNotePageState();
}

class _SelectNewNotePageState extends State<SelectNewNotePage> {
  SelectNewNotePageViewModel get vm => widget.vm;
  Widget get _createButtonListBuilder => ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => CreateNoteButtonListItem(
          createNote: vm.createNoteEntitysList[index],
        ),
        itemCount: vm.createNoteEntitysList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
        titleText: 'New notes',
      ),
      body: AppWrapper(
        maxWidth: 700,
        child: Scaffold(
          body: SingleChildScrollView(
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
                  _createButtonListBuilder
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
