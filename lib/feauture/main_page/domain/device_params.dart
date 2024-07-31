import 'package:flutter/material.dart';

abstract class DeviceParams {
  static bool checkIsTouchDevice(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.fuchsia;
  }
}
