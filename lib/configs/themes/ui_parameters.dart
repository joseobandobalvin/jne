import 'package:flutter/material.dart';
import 'package:get/get.dart';

double _mobileScreenPadding = 24.0;
double _cardBorderradius = 10.0;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderradius => _cardBorderradius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderradius);

  static EdgeInsets get mobileScreenPadding =>
      EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() {
    return Get.isDarkMode ? true : false;
  }
}
