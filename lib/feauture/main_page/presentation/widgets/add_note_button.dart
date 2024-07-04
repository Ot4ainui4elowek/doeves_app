import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key, this.shape, this.elevation});
  final ShapeBorder? shape;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: elevation,
      hoverElevation: elevation,
      shape: shape,
      onPressed: () => context.push(AppRoutes.selectNewNotePage),
      child: const Icon(Icons.add_rounded),
    );
  }
}
