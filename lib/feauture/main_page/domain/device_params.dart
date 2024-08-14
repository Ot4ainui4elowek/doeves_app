import 'package:flutter/material.dart';

abstract class DeviceInfo {
  static bool checkIsTouchDevice(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.fuchsia;
  }

  static bool checkIsSmallMainScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 540;
}
