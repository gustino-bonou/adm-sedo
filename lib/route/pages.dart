import 'package:adms/future/authentication/login/screen/login_screen.dart';
import 'package:adms/future/authentication/otp/screen/confirm.otp.screen.dart';
import 'package:adms/future/authentication/register/screen/register.screen.dart';
import 'package:adms/future/delivery_persons/screen/delivery.person.detail.screen.dart';
import 'package:adms/future/home/screen/home.dart';
import 'package:adms/future/home/screen/onboarding.screen.dart';
import 'package:adms/future/delivery_persons/screen/nearby.deliveries.dart';
import 'package:adms/future/notification/screen/notification.detail.screen.dart';
import 'package:adms/future/notification/screen/notification.list.screen.dart';
import 'package:adms/future/order/deliveried_and_echeck/screen/control.screen.dart';
import 'package:adms/future/order/detail/order.detail.screen.dart';
import 'package:adms/future/profile/screen/profile.screen.dart';
import 'package:adms/future/profile/screen/update.profile.screen.dart';
import 'package:adms/route/routes.string.dart';
import 'package:get/get.dart';
import '../future/authentication/register/screen/register.second.screen.form.dart';
import '../future/delivery_persons/screen/deliveries.screen.dart';
import '../future/order/InProgessAndPending/screen/control.screen.dart';

class AllPages {
  static List<GetPage> getPage() {
    return [

      //Auth
      GetPage(
        name: TRoute.onBoarding,
        page: () =>   OnBoardingScreen(),
      ),
      GetPage(
        name: TRoute.login,
        page: () =>   LoginScreen(),
      ),
      GetPage(
        name: TRoute.register,
        page: () =>   RegisterFirstScreen(),
      ),
      GetPage(
        name: TRoute.registerSecondStep,
        page: () =>   RegisterSecondScreen(),
      ),
      GetPage(
        name: TRoute.verifyOtp,
        page: () =>   EnterOtpScreen(),
      ),
      //Notifications
      GetPage(
        name: TRoute.notificationList,
        page: () =>  NotificationListScreen(),
      ),
      GetPage(
        name: TRoute.notificationDetail,
        page: () =>   NotificationDetailScreen(),
      ),
      GetPage(
        name: TRoute.deliveryPersons,
        page: () =>   NearbyDeliveryPersonListScreen(),
      ),
      GetPage(
        name: TRoute.deliveryPersonDetail,
        page: () =>   DeliveryPersonDetailScreen(),
      ),
      GetPage(
        name: TRoute.deliveryListPerson,
        page: () =>   DeliveryListScreen(),
      ),
      GetPage(
        name: TRoute.profileScreen,
        page: () =>   ProfileScreen(),
      ),
      GetPage(
        name: TRoute.updateProfile,
        page: () =>   UpdateProfileScreen(),
      ),
      GetPage(
        name: TRoute.mainScreen,
        page: () =>    HomeScreen(),
      ),

      //order
      GetPage(
        name: TRoute.inProgressAnPendingOrder,
        page: () =>    OrderInProgressAndPendingScreens(),
      ),
      GetPage(
        name: TRoute.deliveredAndEchecOrder,
        page: () =>    DeliveredAndEchecScreens(),
      ),
      GetPage(
        name: TRoute.orderDetail,
        page: () =>    OrderDetailScreen(),
      ),


    ];
  }
}