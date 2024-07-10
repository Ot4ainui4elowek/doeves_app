import 'package:doeves_app/core/presentation/text_fields/clear_text_field.dart';
import 'package:doeves_app/feauture/create_note/domain/entity/content/text/create_text_content_impl.dart';
import 'package:flutter/material.dart';

class TextContentWidget extends StatelessWidget {
  const TextContentWidget(this.content, {super.key});

  final CreateTextContentImpl content;

  @override
  Widget build(BuildContext context) {
    return ClearTextField(
      context: context,
      controller: content.controller,
    );
  }
}
