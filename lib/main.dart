import 'package:adms/future/authentication/current_user/current.user.controller.dart';
import 'package:adms/route/pages.dart';
import 'package:adms/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/helper/dependancies.dart' as dependencies;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependencies.init();
  final firstRoute = await CurrentUserController.instance.initFirstRoute();
  runApp( MyApp(initialRoute: firstRoute,));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key, required this.initialRoute});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      getPages: AllPages.getPage(),
      defaultTransition: Transition.noTransition,
      initialRoute: initialRoute,
    );
  }
}
