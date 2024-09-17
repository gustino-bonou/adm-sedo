import 'package:adms/data/repositories/notification.repository.dart';
import 'package:adms/future/notification/controller/notification.list.controller.dart';
import 'package:adms/future/order/deliveried_and_echeck/controller/delivered.order.controller.dart';
import 'package:adms/future/order/deliveried_and_echeck/controller/echec.order.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../data/api/api.client.dart';
import '../../data/repositories/auth.repository.dart';
import '../../future/authentication/current_user/current.user.controller.dart';
import '../../future/authentication/otp/controller/otp.controller.dart';
import '../../future/delivery_persons/controller/available.deliveries.persons.controller.dart';
import '../../future/delivery_persons/controller/delivery.persons.list.controller.dart';
import '../../future/delivery_persons/controller/nearby.deliveries.persons.controller.dart';
import '../../future/delivery_persons/controller/occupied.deliveries.persons.controller.dart';
import '../../future/home/controller/navigation.controller.dart';
import '../../future/notification/controller/notification.detaail.controller.dart';
import '../../future/order/InProgessAndPending/controller/in.progress.order.controller.dart';
import '../../future/order/InProgessAndPending/controller/pending.controller.dart';
import '../../future/order/InProgessAndPending/controller/screen.controller.dart';
import '../../future/order/deliveried_and_echeck/controller/screen.controller.dart';
import '../../future/profile/controller/profile.controller.dart';
import '../local_storage/get.storage.service.dart';


Future<void> init() async{
  Get.put<StorageService>(StorageService());
  Get.put<ApiClient>(ApiClient());

  Get.put<CurrentUserController>(CurrentUserController());

  Get.put<NavigationController>(NavigationController());

  Get.put<AuthRepository>(AuthRepository(apiClient: Get.find()));
  Get.put<NotificationRepository>(NotificationRepository(apiClient: Get.find()));


  Get.lazyPut(() => ProfileController(authRepository: Get.find()), fenix: true);
  //Get.lazyPut(() => LoginController(authRepository: Get.find()), fenix: true);
  //Get.lazyPut(() => RegisterController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => OtpController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => NotificationListController(repository: Get.find()), fenix: true);
  Get.lazyPut(() => NotificationDetailController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => DeliveryPersonListController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => AvailableDeliveryPersonController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => OccupiedDeliveryPersonController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => NearbyDeliveryPersonController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => InProgressAnPendingScreenController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => PendingOrderController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => InProgressOrderController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => DeliveredAndEchecScreenController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => DeliveredOrderController(authRepository: Get.find()), fenix: true);
  Get.lazyPut(() => EchecOrderController(authRepository: Get.find()), fenix: true);
}
