import 'package:flutter/material.dart';

class WBottomSheetTheme {
  WBottomSheetTheme._();

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
