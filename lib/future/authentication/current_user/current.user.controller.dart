
import 'package:adms/future/authentication/model/user.dart';
import '../../../utils/constants/local.storage.constant.dart';
import '../../../utils/helper/import.app.path.dart';
import '../../../utils/local_storage/get.storage.service.dart';

class CurrentUserController extends GetxController {
  static  CurrentUserController get instance => Get.find();

  final localStorageService = Get.find<StorageService>();


  String firstRoute = TRoute.login;
  Rx<User> currentUser = User().obs;

  Future<void> saveLocalUserInformation(User user,) async {
    await localStorageService.setString(LocalStorageConstant.token, user.token ?? "");
    await localStorageService.setString(LocalStorageConstant.userId, user.id ?? '');
    await localStorageService.setString(LocalStorageConstant.name, user.name ?? '');
    await localStorageService.setString(LocalStorageConstant.surname, user.surname ?? '') ;
    await localStorageService.setString(LocalStorageConstant.email, user.email ?? '');
    await localStorageService.setString(LocalStorageConstant.phone, user.phoneNumber ?? '');
    await localStorageService.setString(LocalStorageConstant.role, user.role ?? "");
    await localStorageService.setString(LocalStorageConstant.token, user.token ?? "");
  }

  Future<void> getLocalUserInfo() async {
    final userToken =  await localStorageService.getString(LocalStorageConstant.token);
    final userId =  await localStorageService.getString(LocalStorageConstant.userId);
    final userFirstName =  await localStorageService.getString(LocalStorageConstant.name);
    final userLastName = await localStorageService.getString(LocalStorageConstant.surname);
    final userEmail = await localStorageService.getString(LocalStorageConstant.email);
    final userPhone = await localStorageService.getString(LocalStorageConstant.phone);
    final role = await localStorageService.getString(LocalStorageConstant.role);

    currentUser.value = User(
        id: userId,
        name: userFirstName,
        surname: userLastName,
        email: userEmail,
        phoneNumber: userPhone,
        token: userToken,
        role: role,
    );
  }

  Future<String> initFirstRoute() async{
    String route = TRoute.login;
    bool? isFirstTime = await localStorageService.getBool(LocalStorageConstant.isFirstTime);
    if(isFirstTime == false) {

      String? token = await localStorageService.getString(LocalStorageConstant.token);
      if(token != null) {
        route =  TRoute.mainScreen;
      }
    } else {

      localStorageService.setBool(LocalStorageConstant.isFirstTime, false);
      route =  TRoute.onBoarding;
    }
    return route;
  }

  @override
  void onInit() async{
    super.onInit();
    await getLocalUserInfo();
    await initFirstRoute();
  }
}