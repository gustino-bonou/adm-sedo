import 'package:adms/common/widget/loader/loader.dart';
import 'package:adms/future/authentication/current_user/current.user.controller.dart';
import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../../data/repositories/auth.repository.dart';

class RegisterController extends GetxController {
  static  RegisterController get instance => Get.find();

  final currentUserController = CurrentUserController.instance;

  final AuthRepository authRepository;
  RegisterController({required this.authRepository});
  String errorMessage = "";
  var isFocusedPhone = false.obs;
  var isFocusedEmail = false.obs;
  var isFocusedPs = false.obs;
  var isFocusedFirstname = false.obs;
  var isFocusedLastname = false.obs;
  var isFocusedAddress = false.obs;
  var isFocusedConfirmPassword = false.obs;
  RxString step = '1'.obs;
  late FocusNode phoneFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode firstnameFocusNode;
  late FocusNode lastnameFocusNode;
  late FocusNode psFocusNode;
  late FocusNode confirmPsFocusNode;

  final phoneController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  RxString countryCode = "+229".obs;
  RxBool isLoading = false.obs;
  RxBool visiblePassword = false.obs;

  RxString formErrorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    firstnameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    psFocusNode = FocusNode();
    confirmPsFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    lastnameFocusNode = FocusNode();

    // Listen to focus changes
    emailFocusNode.addListener(() {
      isFocusedEmail.value = emailFocusNode.hasFocus;
    });
    psFocusNode.addListener(() {
      isFocusedPs.value = psFocusNode.hasFocus;
    });
    firstnameFocusNode.addListener(() {
      isFocusedFirstname.value = firstnameFocusNode.hasFocus;
    });
    confirmPsFocusNode.addListener(() {
      isFocusedConfirmPassword.value = confirmPsFocusNode.hasFocus;
    });
    lastnameFocusNode.addListener(() {
      isFocusedLastname.value = lastnameFocusNode.hasFocus;
    });
    phoneFocusNode.addListener(() {
      isFocusedPhone.value = phoneFocusNode.hasFocus;
    });
  }

  @override
  void onClose() {
    firstnameFocusNode.dispose();
    psFocusNode.dispose();
    emailFocusNode.dispose();
    confirmPsFocusNode.dispose();
    lastnameFocusNode.dispose();
    phoneFocusNode.dispose();
    super.onClose();
  }

  RxBool isValidForm1 = false.obs;
  RxBool isValidForm2 = false.obs;

  void checkForm1IsValidate() {
    bool isValidFirstname = TValidator.isValidString(firstnameController.text.trim());
    bool isValidLastname = TValidator.isValidString(lastnameController.text.trim());
    bool isValidPhone = TValidator.isValidPhone(phoneController.text.trim(), countryCode.value);
    bool isValidEmail = TValidator.isValidEmail(emailController.text.trim());

    if(isValidFirstname && isValidEmail && isValidLastname && isValidPhone){
      isValidForm1.value = true;
    } else {
      isValidForm1.value = false;
    }
  }

  void updateErrorMsg() {
    formErrorMessage.value = TValidator.notValidPasswordMessage(passwordController.text);
  }

  void checkForm2IsValidate() {
    bool isValidPassword = TValidator.isValidPassword(
        passwordController.text.trim()) &&
        confirmPasswordController.text.trim() == passwordController.text.trim();
    if(isValidPassword){
      isValidForm2.value = true;
    } else {
      isValidForm2.value = false;
    }
  }

  void setCountryCode(newValue) {
    countryCode.value = newValue ?? '229';
  }

  Map<String, dynamic> registerData() {
    Map<String, dynamic> data = {
      'name': firstnameController.text.trim(),
      'surname': lastnameController.text.trim(),
      'email': emailController.text.trim(),
      'phone_number': countryCode.value + phoneController.text.trim(),
      'password': passwordController.text.trim(),
    };
    return data;
  }

  bool get showStep1 => step.value == "1";
  bool get showStep2 => step.value == "2";
  void goToStep2() {
    if(isValidForm1.value) {
      goToNamed(TRoute.registerSecondStep);
    }
  }

  Future<void> register(context) async{
    if(isLoading.value) return;
    isLoading.value = true;
    if(isValidForm1.value && isValidForm2.value) {
      Response response = await authRepository.register(registerData());
      if(response.statusCode == 200) {
        isLoading.value = false;
        Map<String, dynamic> userData = response.body;
        User user = User.fromJson(userData['users']);
        currentUserController.saveLocalUserInformation(user);
        goToOtpRoute(user.id, user.email);
      } else{

        isLoading.value = false;
        if(response.statusCode == 400) {
          errorMessage  ="Un utilisateur possède déjà ces informations.";
        } else  {
          errorMessage = "Une erreur s'est produite lors de l'inscription.";
        }
        print(response.body);
        print(response.statusCode);
        print(registerData());
        TLoaders.errorSnackBar(
            title: 'Inscription', message: errorMessage
        );
      }
    }
  }

  void goToOtpRoute(userId, email) {
    goToNamed(TRoute.verifyOtp, {'userId' : userId, 'email' : email});
  }
  void goToLoginRoute() {
    goToNamed(TRoute.login);
  }
}