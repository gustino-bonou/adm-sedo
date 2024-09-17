import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme =  TextTheme(
    headlineLarge: const TextStyle( fontSize: 32, fontWeight: FontWeight.bold, color: TColor.mediumTitle, ),
    headlineMedium: const TextStyle( fontSize: 24, fontWeight: FontWeight.w600, color: TColor.mediumTitle,),
    headlineSmall: const TextStyle( fontSize: 18, fontWeight: FontWeight.w600, color: TColor.mediumTitle,),

    titleLarge: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.largeTitle, ),
    titleMedium: const TextStyle( fontSize: 22, fontWeight: FontWeight.w700, color: TColor.mediumTitle,),
    titleSmall: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0, color: TColor.smallTitle),

    bodyLarge:  const TextStyle(fontSize: 18.0,),
    bodyMedium: const TextStyle(fontSize: 16.0, fontWeight:FontWeight.w400, color: TColor.mediumTitle,),
    bodySmall: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0, color: TColor.mediumTitle),
    
    labelLarge: const TextStyle( fontSize: 12, fontWeight: FontWeight.normal, color: TColor.mediumTitle,),
    labelMedium: const TextStyle( fontSize: 12, fontWeight: FontWeight.normal, ),
    labelSmall: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color: TColor.mediumTitle.withOpacity(0.8)),
  );


  static TextTheme darkTextTheme = const TextTheme(
      headlineLarge: TextStyle( fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white,),
      headlineMedium: TextStyle( fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white,),
      headlineSmall: TextStyle( fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white,),

      titleLarge: TextStyle( fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white,),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white,),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white,),

      bodyLarge: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white,),
      bodyMedium: TextStyle( fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,),
      bodySmall: TextStyle( fontSize: 14, fontWeight: FontWeight.w500, ),


      labelLarge: TextStyle( fontSize: 16, fontWeight: FontWeight.normal,),
      labelMedium: TextStyle( fontSize: 12, fontWeight: FontWeight.normal, ),
  );
}