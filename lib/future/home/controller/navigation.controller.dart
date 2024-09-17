import 'package:adms/future/admin/admin.screen.dart';
import 'package:adms/future/notification/screen/notification.list.screen.dart';
import 'package:adms/future/profile/screen/profile.screen.dart';
import '../../../utils/helper/import.app.path.dart';
import '../../delivery_persons/screen/deliveries.screen.dart';
import '../screen/home.dart';

class NavigationController extends GetxController{
  static  NavigationController get instance => Get.find();

  var currentIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    AdminScreen(),
    DeliveryListScreen(),
    NotificationListScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Widget activeScreen() {
    return screens[currentIndex.value];
  }
}

