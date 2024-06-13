import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/feauture/select_new_note_page.dart/domain/entity/create_note_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectNewNotePageViewModel {
  final List<CreateNoteEntity> createNoteEntitysList = [
    CreateNoteEntity(
      title: 'Interesting Idea',
      description: 'Use free text area, feel free to write it all',
      onPressed: (BuildContext context) {
        context.push(AppRoutes.createNotePage);
      },
      icon: Icons.lightbulb,
    ),
  ];
}
