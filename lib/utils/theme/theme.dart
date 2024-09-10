import 'package:flutter/material.dart';
import 'package:white_matrix_ecommerce/utils/theme/custom_themes/appbar_theme.dart';
import 'package:white_matrix_ecommerce/utils/theme/custom_themes/bottom_sheet_theme.dart';

import 'package:white_matrix_ecommerce/utils/theme/custom_themes/textfield_theme.dart';

import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_theme.dart';

class WAppTheme {
  WAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: WTextTheme.dartTextTheme,
    primaryColor: Colors.blue,
    appBarTheme: WAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: WBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: WTextFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: WElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
