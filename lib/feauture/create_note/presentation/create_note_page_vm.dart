import 'package:doeves_app/feauture/create_note/domain/entity/content_widget_entity.dart';
import 'package:flutter/material.dart';

class CreateNotePageViewModel {
  final List<ContentWidgetEntity> contentWidgetDatatList = [
    ContentWidgetEntity(
      icon: Icons.description,
      onPressed: () {},
      title: 'Add description',
    ),
    ContentWidgetEntity(
      icon: Icons.image,
      onPressed: () {},
      title: 'Add image',
    ),
    ContentWidgetEntity(
      icon: Icons.mic_rounded,
      onPressed: () {},
      title: 'Add voice',
    ),
  ];
}
