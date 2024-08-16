import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

abstract class PaginationSelectableListViewModel {
  final ScrollController scrollController = ScrollController();

  final isSelectedMode = false.rv;

  final isLoading = false.rv;

  abstract final Rv<List> entitysList;
  abstract final Rv<List> selectedEntitysList;

  void init() {
    log('init');
    scrollController.addListener(checkScroll);
    isSelectedMode.addListener(clearSelectedLsit);
    entitysList.addListener(checkAllNotesIsSelected);
    selectedEntitysList.addListener(checkAllNotesIsSelected);
  }

  void dispose() {
    scrollController.removeListener(checkScroll);
    isSelectedMode.removeListener(clearSelectedLsit);
    entitysList.removeListener(checkAllNotesIsSelected);
    selectedEntitysList.removeListener(checkAllNotesIsSelected);
  }

  Future<void> getEntitys();

  void checkAllNotesIsSelected();

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
