import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../controller/navigation.controller.dart';


class MainScreen extends GetView<NavigationController> {
  MainScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          controller.changeIndex(index);
        },
        children: controller.screens,
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        unselectedItemColor: const Color(0xFF404040),
        selectedItemColor: TColor.linearcolor.colors.first,
        currentIndex: controller.currentIndex.value,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins',
        ),
        onTap: (index) {
          controller.changeIndex(index);
          _pageController.jumpToPage(index);
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