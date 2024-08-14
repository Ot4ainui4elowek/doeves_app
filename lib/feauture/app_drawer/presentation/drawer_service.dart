import 'package:flutter/material.dart';

class DrawerService {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void openDrawer() {
    if (key.currentState?.hasDrawer ?? false) {
      key.currentState?.openDrawer();
    }
  }
}
