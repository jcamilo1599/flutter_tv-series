import 'package:flutter/material.dart';

import '../../ui/common/tokens/colors.dart';
import '../../ui/common/tokens/fonts.dart';

class Themes {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: TokensFonts.gilroy,
    scaffoldBackgroundColor: TokensColors.black,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: TokensColors.yellow,
        ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.w600),
      headline2: TextStyle(fontWeight: FontWeight.w600),
      headline3: TextStyle(fontWeight: FontWeight.w600),
      headline4: TextStyle(fontWeight: FontWeight.w600),
      headline5: TextStyle(fontWeight: FontWeight.w600),
      headline6: TextStyle(fontWeight: FontWeight.w300),
      subtitle1: TextStyle(fontWeight: FontWeight.w600),
      subtitle2: TextStyle(fontWeight: FontWeight.w600),
      bodyText1: TextStyle(fontWeight: FontWeight.w300),
      bodyText2: TextStyle(fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: TokensColors.yellow,
        foregroundColor: TokensColors.gray,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: TokensColors.yellow,
      ),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
  );
}
