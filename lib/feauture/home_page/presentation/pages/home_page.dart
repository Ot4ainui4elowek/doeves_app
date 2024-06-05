import 'package:doeves_app/core/domain/router/doeves_routes.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:doeves_app/core/presentation/hero_search_tf.dart';
import 'package:doeves_app/feauture/home_page/presentation/widgets/add_note_button/add_note_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: HeroSearch(
              onTap: () => context.push(AppRoutes.goToNotesSearchPage),
            ),
          ),
          floatingActionButton: const AddNoteButton(),
        ),
      ),
    );
  }
}
