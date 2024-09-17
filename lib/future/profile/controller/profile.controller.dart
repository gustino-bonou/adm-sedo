import 'package:adms/future/authentication/current_user/current.user.controller.dart';
import 'package:adms/future/authentication/model/user.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import '../../../common/widget/dialog/dialog.dart';
import '../../../data/repositories/auth.repository.dart';

class ProfileController extends GetxController{
  static  ProfileController get instance => Get.find();

  final AuthRepository authRepository;
  ProfileController({required this.authRepository});

  final Rx<User> _currentUser = User().obs;
  User  get user => _currentUser.value ;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String actionText  = "";
  TextEditingController attributeController = TextEditingController() ;


  void openNameDialog(context, attributeName) {
    initAttributeData(attributeName);
    openSmoothTextFormDialog(
      context: context,
      onSubmit: (value) {
        print("Submitted value: $value");
      },
      controller: attributeController,
      title: 'Modification pofil',
      actionMessage: actionText,
    );
  }

  initTextEditingController() {
    _nameController.text = user.name ?? "";
    _firstnameController.text = user.surname ?? "";
    _emailController.text = user.email ?? "";
    _phoneController.text = user.phoneNumber ?? "";
  }

  void initAttributeData(attributeName) {
    switch(attributeName) {
      case 'phone':
        actionText = "Veuillez renseigner votre numéro";
        attributeController.text = _phoneController.text;
        break;
      case 'email':
        actionText = "Veuillez renseigner votre email";
        attributeController = _emailController;
        break;
      case 'name':
        actionText = "Veuillez renseigner votre nom";
        attributeController = _nameController;
        break;
      case 'surname':
        actionText = "Veuillez renseigner votre prenom";
        attributeController = _firstnameController;
        break;
    }
  }


  @override
  void onInit() async{
    CurrentUserController.instance.getLocalUserInfo();
    _currentUser.value = CurrentUserController.instance.currentUser.value;
    super.onInit();
    initTextEditingController();
  }


}