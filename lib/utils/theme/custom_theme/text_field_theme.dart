import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextFieldTheme{
  TTextFieldTheme._();

  ///Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: TColor.hintText, fontWeight: FontWeight.w400),
    floatingLabelStyle: const TextStyle().copyWith(color: TColor.mediumTitle),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(width: 1, color: TColor.hintText)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(width: 1, color: TColor.hintText)
    ),
    contentPadding: EdgeInsets.only(
      top: 10,
      bottom: 10,
      left: 15,
      right: 15
    ),
    focusedBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(24),
        borderSide:  BorderSide(width: 1, 
            color: TColor.kcPrimaryColor.withOpacity(0.5))
    ),
    errorBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(width: 1, color: Colors.red)
    ),
    focusedErrorBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(24),
    ),
  );

  //dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    //constraints: const BoxConstraints.expand(height: 14)
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.grey)
    ),
    focusedBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.white)
    ),
    errorBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red)
    ),
    focusedErrorBorder:  const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1, color: Colors.red)
    ),
  );
}