import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class PaginationSelectableListController<T, D> {
  PaginationSelectableListController({
    required this.checkAllEntitysIsSelected,
    required this.entitysList,
    required this.getEntitys,
    required this.selectedEntitysList,
  });

  final ScrollController scrollController = ScrollController();

  final isSelectedMode = false.rv;

  final isLoading = false.rv;

  final Rv<List<T>> entitysList;
  final Rv<List<D>> selectedEntitysList;
  final Future<void> Function() getEntitys;
  final void Function() checkAllEntitysIsSelected;

  void init() {
    log('init');
    scrollController.addListener(checkScroll);
    isSelectedMode.addListener(clearSelectedLsit);
    entitysList.addListener(checkAllEntitysIsSelected);
    selectedEntitysList.addListener(checkAllEntitysIsSelected);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
    isSelectedMode.removeListener(clearSelectedLsit);
    entitysList.removeListener(checkAllEntitysIsSelected);
    selectedEntitysList.removeListener(checkAllEntitysIsSelected);
  }

  void clearSelectedLsit() {
    if (!isSelectedMode.value) {
      selectedEntitysList.clear();
    }
  }

  void checkScroll() {
    if (!isSelectedMode.value &&
        !isLoading.value &&
        scrollController.position.atEdge &&
        scrollController.position.pixels != 0) {
      getEntitys();
    }
  }
}
