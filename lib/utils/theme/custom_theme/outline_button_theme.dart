import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TOutlineButtonTheme{
  TOutlineButtonTheme._();

  static OutlinedButtonThemeData lightOutlineButtonTheme = OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          foregroundColor: TColor.mediumTitle,
          backgroundColor: TColor.kcPrimaryColor,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: TColor.kcPrimaryColor),
          //side: const BorderSide(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16, color: TColor.mediumTitle, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7), side: BorderSide(color: TColor.mediumTitle))
      )
  );

  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );

}