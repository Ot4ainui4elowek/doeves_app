import 'package:doeves_app/core/presentation/app_bars/title_app_bar.dart';
import 'package:doeves_app/core/presentation/app_wrapper.dart';
import 'package:flutter/material.dart';

class CreateCatalogPage extends StatefulWidget {
  const CreateCatalogPage({super.key});

  @override
  State<CreateCatalogPage> createState() => _CreateCatalogPageState();
}

class _CreateCatalogPageState extends State<CreateCatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        context: context,
        titleText: 'Catalog',
      ),
      body: const AppWrapper(
        maxWidth: 700,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
