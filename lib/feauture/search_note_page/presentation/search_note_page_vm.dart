import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class SearchNotePageViewModel {
  final focusNode = FocusNode();

  final searchBarIsSelected = false.rv;

  checkSearchBarIsSelected() {
    searchBarIsSelected(focusNode.hasFocus);
  }

  void init() {
    focusSearchTextField();
    focusNode.addListener(checkSearchBarIsSelected);
  }

  void dispose() {
    focusNode.removeListener(checkSearchBarIsSelected);
    focusNode.dispose();
  }

  void focusSearchTextField() {
    Future.delayed(const Duration(milliseconds: 350), () {
      // 350 was the least I could go
      focusNode.requestFocus();
    });
  }
}
