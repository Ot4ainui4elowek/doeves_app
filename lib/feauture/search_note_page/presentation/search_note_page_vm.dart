import 'package:flutter/material.dart';

class SearchNotePageViewModel {
  final focusNode = FocusNode();
  void focusSearchTextField() {
    Future.delayed(const Duration(milliseconds: 350), () {
      // 350 was the least I could go
      focusNode.requestFocus();
    });
  }
}
