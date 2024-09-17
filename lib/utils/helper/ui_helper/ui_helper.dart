import 'package:adms/utils/constants/size.dart';
import 'package:flutter/material.dart';

class UiHelper {

  static Widget horizontalSpaceTiny = const SizedBox(width: TSizes.tinySize);
  static Widget get horizontalSpaceSmall => SizedBox(width: TSizes.width10);
  static Widget get horizontalSpaceMedium => SizedBox(width: TSizes.width25);
  static Widget get horizontalSpace20 => SizedBox(width: TSizes.width20);
  static Widget get horizontalSpaceLarge => SizedBox(width: TSizes.width50);

  static Widget get verticalSpaceTiny => const SizedBox(height: TSizes.tinySize);
  static Widget get verticalSpaceSmall => SizedBox(height: TSizes.height10);
  static Widget get verticalSpaceMedium => SizedBox(height: TSizes.height25);
  static Widget get verticalSpaceLarge => SizedBox(height: TSizes.height50);
}