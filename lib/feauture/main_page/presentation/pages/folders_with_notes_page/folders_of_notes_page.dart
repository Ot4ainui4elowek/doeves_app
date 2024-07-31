import 'package:doeves_app/core/presentation/animated_visibility.dart';
import 'package:doeves_app/core/presentation/buttons/app_elevated_button.dart';
import 'package:doeves_app/feauture/main_page/domain/device_params.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/buttons/selection_mode_button.dart';
import 'package:doeves_app/feauture/main_page/presentation/widgets/selectable_container.dart';
import 'package:doeves_app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class FolderWithNotesPage extends StatefulWidget {
  const FolderWithNotesPage({super.key});

  @override
  State<FolderWithNotesPage> createState() => _FolderWithNotesPageState();
}

class _FolderWithNotesPageState extends State<FolderWithNotesPage> {
  Widget get _foldersLoadinIndicatorBuilder => const SizedBox(height: 0);

  Widget get _refreshButtonBuilder => AnimatedVisibility(
        visible: !DeviceParams.checkIsTouchDevice(context),
        child: const AppElevatedButton(
          width: 100,
          mini: true,
          child: Icon(Icons.refresh),
        ),
      );

  Widget get _selectionModeButtonBuilder => SelectionModeButton(
        isSelectedMode: false,
        onPressed: () {},
      );

  SliverAppBar get _appBarBuilder => SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        expandedHeight: 65,
        title: _refreshButtonBuilder,
        actions: [
          _selectionModeButtonBuilder,
          const SizedBox(width: 16),
        ],
        snap: true,
        floating: true,
      );

  SliverToBoxAdapter get _catalogsListViewBuilder => SliverToBoxAdapter(
        child: ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          footer: _foldersLoadinIndicatorBuilder,
          shrinkWrap: true,
          buildDefaultDragHandles: false,
          itemBuilder: (context, index) => ReorderableDelayedDragStartListener(
            index: index,
            key: ObjectKey(Text(index.toString())),
            child: SelectableContainer(
              isSelectedMode: false,
              thisItemIsSelected: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.folder_outlined,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Folder  $index',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextTheme.textXl(weight: TextWeight.regular)
                            .copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: 10,
          onReorder: (oldIndex, newIndex) {},
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        _appBarBuilder,
        _catalogsListViewBuilder,
      ],
    ));
  }
}
