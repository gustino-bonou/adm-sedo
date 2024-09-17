
import '../../../../common/widget/loader/loader.dart';
import '../../../../data/repositories/auth.repository.dart';
import '../../../../utils/constants/local.storage.constant.dart';
import '../../../../utils/helper/import.app.path.dart';
import '../../../../utils/local_storage/get.storage.service.dart';
import '../../current_user/current.user.controller.dart';
import '../../model/user.dart';


class LoginController extends GetxController {
  final AuthRepository authRepository;
  LoginController({required this.authRepository});

  final currentUserController = CurrentUserController.instance;

  String errorMessage = "";
  var isFocusedPhone = false.obs;
  var isFocusedPs = false.obs;
  var isFocusedEmail = false.obs;
  RxString step = '1'.obs;
  late FocusNode phoneFocusNode;
  late FocusNode psFocusNode;
  late FocusNode emailFocusNode;

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  RxString countryCode = "+229".obs;
  RxBool isLoading = false.obs;
  RxBool visiblePassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    psFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();

    // Listen to focus changes
    psFocusNode.addListener(() {
      isFocusedPs.value = psFocusNode.hasFocus;
    });
    phoneFocusNode.addListener(() {
      isFocusedPhone.value = phoneFocusNode.hasFocus;
    });
    emailFocusNode.addListener(() {
      isFocusedEmail.value = emailFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    psFocusNode.dispose();
    phoneFocusNode.dispose();
    super.onClose();
  }

  RxBool isValidForm = false.obs;

  void checkFormIsValidate() {
    bool isValidEmail = TValidator.isValidEmail(emailController.text.trim());
    bool isValidPassword = TValidator.isValidString(passwordController.text.trim());

    if(isValidPassword && isValidEmail){
      isValidForm.value = true;
    } else {
      isValidForm.value = false;
    }
  }

  void setCountryCode(newValue) {
    countryCode.value = newValue ?? '229';
  }

  Map<String, dynamic> loginData() {
    Map<String, dynamic> data = {
      'email':  emailController.text.trim(),
      'password': passwordController.text.trim(),
    };
    return data;
  }

  Future<void> login(context) async{

    if(isLoading.value) return;
    isLoading.value = true;
    if(isValidForm.value ) {
      Response response = await authRepository.login(loginData());
      if(response.statusCode == 200) {
        isLoading.value = false;
        Map<String, dynamic> responseData = response.body;
        Map<String, dynamic> data = {
          'id' : responseData['userId'] ?? '',
          'name' : responseData['name'] ?? '',
          'surname' : responseData['surname'] ?? '',
          'token' : responseData['token'] ?? '',
          'email' : responseData['email'] ?? '',
          'phone_number' : responseData['phone_number'] ?? '',
        };
        User user = User.fromJson(data);
        await currentUserController.saveLocalUserInformation(user);
        await currentUserController.getLocalUserInfo();
        Get.offAllNamed(TRoute.mainScreen);
      } else{
        isLoading.value = false;
        if(response.body is String){
          errorMessage = response.body;
        } else {
          errorMessage = "Une erreur s'est produite lors de la connexion, veuillez réessayer";
        }

        TLoaders.errorSnackBar(title: 'Inscription',  message: errorMessage);
      }
    }
  }

  void goToRegisterRoute() {
    goToNamed(TRoute.register);
  }
}