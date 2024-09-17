import 'package:adms/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color underlineColor;
  final double underlineThickness;
  final double paddingBottom;

  UnderlinedText({super.key,
    required this.text,
    this.fontSize = 12,
    this.color = TColor.kcPrimaryColor,
    this.underlineColor = TColor.kcPrimaryColor,
    this.underlineThickness = 3,
    this.paddingBottom = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: underlineColor,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}
