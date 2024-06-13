import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                title: Text(
                  'Title',
                  style: AppTextTheme.textBase(weight: TextWeight.medium),
                ),
                subtitle: Column(
                  children: [
                    Text(
                      'description is good. description is good. description is good. description is good. ',
                      style: AppTextTheme.textSm(weight: TextWeight.regular),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
