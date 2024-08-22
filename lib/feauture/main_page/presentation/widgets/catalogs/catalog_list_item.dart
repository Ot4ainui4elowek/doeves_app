import 'package:doeves_app/feauture/main_page/data/model/catalogs/catalog_response_model.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CatalogListItem extends StatelessWidget {
  const CatalogListItem({
    super.key,
    required this.catalog,
    required this.onTap,
  });
  final CatalogResponseModel catalog;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            const Icon(Icons.folder_open_outlined),
            const SizedBox(width: 10),
            Flexible(
                child: Text(
              catalog.name,
              style: AppTextTheme.textBase(weight: TextWeight.medium),
            ))
          ],
        ),
      ),
    );
  }
}
