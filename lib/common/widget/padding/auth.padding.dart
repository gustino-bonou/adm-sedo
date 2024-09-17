import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';

class AuthScreenPadding extends StatelessWidget {
  const AuthScreenPadding({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.only(
        left: TSizes.width15, right: TSizes.width15,
    ), child:  child,);
  }
}
