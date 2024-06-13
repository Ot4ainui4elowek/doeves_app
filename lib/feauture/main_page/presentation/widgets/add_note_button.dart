import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.push(AppRoutes.selectNewNotePage),
      child: const Icon(Icons.add_rounded),
    );
  }
}
