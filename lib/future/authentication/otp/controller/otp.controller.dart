import 'package:adms/common/widget/loader/loader.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../../data/repositories/auth.repository.dart';

class OtpController extends GetxController {
  final AuthRepository authRepository;
  OtpController({required this.authRepository});

  RxString pinValue = ''.obs;
  RxBool isValidPin = false.obs;
  RxBool apiResponse = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingResentOtp = false.obs;
  RxString userId = ''.obs;
  RxString email = ''.obs;
  String errorMessage = '';
  @override
  void onInit() {
    final args = Get.arguments;
    email.value = args?['email'] ?? '';
    userId.value = args?['userId'] ?? '';
    receiveOtpForEmail();
    super.onInit();
  }

  void setIsValidPin() {
    if(GetUtils.isNumericOnly(pinValue.value) && pinValue.value.length == 4) {
      isValidPin.value = true;
    } else {
      isValidPin.value = false;
    }
    update();
  }

  Future<void> sendOtp(BuildContext context) async {
    setIsValidPin();
    if(isValidPin.value) {
      verifyEmailOtp(context);
    }
  }

  void navigateToNotificationScreen() {
    Get.offAllNamed(TRoute.login);
  }

  Future<void> receiveOtpForEmail() async{
    isLoadingResentOtp.value = true;
    var data = {"toEmail" : email.value};
    await authRepository.receiveOtpByMail(data, userId.value).then((value){
      isLoadingResentOtp.value = false;
    });
  }

  Future<void> verifyEmailOtp(context) async{
    if(isLoading.value) return;
    isLoading.value = true;
    if(isValidPin.value) {
      var data = {
        "typeOfVerification": "email",
        "code": pinValue.value
      };
      Response response = await authRepository.verifyOtp(data, userId.value);
      if(response.statusCode == 200) {
        isLoading.value = false;
        TLoaders.successDialog(
            "Félicitation",
            "Vous avez été enregistré en qu'administrateur avec succès",
            navigateToNotificationScreen,
            context
        );
      } else {
        isLoading.value = false;
        if(response.statusCode == 400) {
          errorMessage = "Code incorect";
        } else {
          errorMessage = "Une erreur s'est produite lors de la vérification du code OTP";
        }
        TLoaders.errorSnackBar(title: 'Inscription', message: errorMessage);
      }
    }
  }
}