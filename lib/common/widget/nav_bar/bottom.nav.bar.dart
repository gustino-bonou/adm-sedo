

import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../future/admin/admin.screen.dart';
import '../../../future/delivery_persons/screen/deliveries.screen.dart';
import '../../../future/home/controller/navigation.controller.dart';
import '../../../future/home/screen/home.dart';
import '../../../future/notification/screen/notification.list.screen.dart';
import '../../../future/profile/screen/profile.screen.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({super.key});

   final NavigationController controller = Get.find<NavigationController>();


   @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10
      ),
      child: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        unselectedItemColor: const Color(0xFF404040),
        selectedItemColor: TColor.kcPrimaryColor,
        currentIndex: controller.currentIndex.value,
        selectedLabelStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'Poppins',
        ),
        onTap: (value) {
          controller.changeIndex(value);
          switch (value) {
            case 0:
              Get.to(() => HomeScreen());
              break;
            case 1:
              Get.to(() => AdminScreen());
              break;
            case 2:
              Get.to(() => DeliveryListScreen());
              break;
            case 3:
              Get.to(() => NotificationListScreen());
              break;
            case 4:
              Get.to(() => ProfileScreen());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(TImages.activeHomeIcon,
                height: 24, width: 24),
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return TColor.linearcolor.createShader(bounds);
              },
              child: SvgPicture.asset(TImages.inactiveHomeIcon,
                  height: 24, width: 24),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(TImages.inactiveThumbUp,
                height: 24, width: 24),
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return TColor.linearcolor.createShader(bounds);
              },
              child: SvgPicture.asset(TImages.inactiveThumbUp,
                  height: 24, width: 24, color: TColor.kcPrimaryColor),
            ),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(TImages.inactiveCoursier,
                height: 24, width: 24),
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return TColor.linearcolor.createShader(bounds);
              },
              child: SvgPicture.asset(TImages.activeCoursier,
                  height: 24, width: 24),
            ),
            label: 'Coursier',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(TImages.inactiveNotification,
                height: 26, width: 24),
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return TColor.linearcolor.createShader(bounds);
              },
              child: SvgPicture.asset(TImages.activeNotification,
                  height: 24, width: 24),
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(TImages.inactiveUser,
                height: 26, width: 24),
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return TColor.linearcolor.createShader(bounds);
              },
              child: SvgPicture.asset(TImages.activeUser,
                  height: 24, width: 24),
            ),
            label: 'Profil',
          ),
        ],
      )),
    );
  }
}