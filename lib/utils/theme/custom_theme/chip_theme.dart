import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TChipTheme{
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(
      color: Colors.black
    ),
    selectedColor: TColor.kcPrimaryColor,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0, vertical: 12.0
    ),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipTheme =const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(
          color: Colors.white
      ),
      selectedColor: TColor.kcPrimaryColor,
      padding: EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 12.0
      ),
      checkmarkColor: Colors.white
  );
}