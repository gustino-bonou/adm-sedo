
import 'package:flutter/services.dart';

import '../import.app.path.dart';

void goToNamed(String route, [dynamic argument]){
  Get.toNamed(
      route,
      arguments: argument
  );
}

void navigateToSubPage(BuildContext context, Widget subPage) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => subPage),
  );
}

void returnToPreviousPage(BuildContext context, [dynamic result]) {
  Navigator.pop(context, result);
}

