import 'package:jne/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/material.dart';

//const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryLightColorLight = Color(0xFF4c8c4a);
//const Color primaryColorLight = Color(0xFFF85187);
const Color primaryColorLight = Color(0xFF0d47a1);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
        primaryColor: primaryColorLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: getIconTheme(),
        cardColor: cardColor,
        textTheme: getTextTheme().apply(
          bodyColor: mainTextColorLight,
          displayColor: mainTextColorLight,
        ));
  }
}
