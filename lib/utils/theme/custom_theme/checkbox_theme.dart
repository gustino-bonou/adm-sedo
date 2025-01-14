import 'package:adms/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TCheckboxTheme{
  TCheckboxTheme._();

  ///customizable light text theme

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(4)
    // ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return Colors.white;
      } else {
        return Colors.black;
    }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected)) {
        return TColor.kcPrimaryColor;
      }else {
        return Colors.transparent;
      }
    })
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(0)
      // ),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)) {
          return TColor.kcPrimaryColor;
        }else {
          return Colors.transparent;
        }
      })
  );
}