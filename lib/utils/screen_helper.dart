import 'package:flutter/material.dart';

enum ScreenSize { mobile, tablet, desktop }

class ScreenHelper {
  static ScreenSize getScreenSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 800) {
      return ScreenSize.mobile;
    } else if (width < 1200) {
      return ScreenSize.tablet;
    } else {
      return ScreenSize.desktop;
    }
  }

  static bool isMobile(BuildContext context) =>
      getScreenSize(context) == ScreenSize.mobile;

  static bool isTablet(BuildContext context) =>
      getScreenSize(context) == ScreenSize.tablet;

  static bool isDesktop(BuildContext context) =>
      getScreenSize(context) == ScreenSize.desktop;
}
