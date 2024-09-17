import 'package:adms/future/authentication/register/controller/register.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:country_code_picker/country_code_picker.dart';

class RegisterFirstStepForm extends GetView<RegisterController> {
  const RegisterFirstStepForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nom",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
        TextFormField(
            validator: TValidator.validateEmail,
            decoration: const InputDecoration(hintText: "BONOU"),
            focusNode: controller.firstnameFocusNode,
            controller: controller.firstnameController,
            onChanged: (value) => controller.checkForm1IsValidate()),
        UiHelper.verticalSpaceSmall,
        Text("Prenom",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: TSizes.tinySize,),
        TextFormField(
            validator: TValidator.validateEmail,
            decoration: const InputDecoration(hintText: "Gustino"),
            focusNode: controller.lastnameFocusNode,
            controller: controller.lastnameController,
            onChanged: (value) => controller.checkForm1IsValidate()),
        UiHelper.verticalSpaceSmall,
        Text("Adresse email",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: TSizes.tinySize,),
        TextFormField(
            validator: TValidator.validateEmail,
            decoration: const InputDecoration(hintText: "aite@gmail.com"),
            focusNode: controller.emailFocusNode,
            controller: controller.emailController,
            onChanged: (value) => controller.checkForm1IsValidate()),
        UiHelper.verticalSpaceSmall,
        Text("Numéro de téléphone",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: TSizes.tinySize,),
        Row(
          children: [
            SizedBox(
              width: TSizes.screenWidth*0.8,
              child: MediaQuery.removePadding(
                removeLeft: true,
                  removeRight: true,
                  context: context,
                  child: CountryCodePicker(
                    showDropDownButton: true,
                    flagWidth: 20,
                    padding: const EdgeInsets.all(0),
                    onChanged: (value) {
                      controller.setCountryCode(value.dialCode);
                    },
                    initialSelection: controller.countryCode.value,
                    favorite: const ['+229', '+228', 'FR', '+227'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
              ),
            ),
            Expanded(
              child: TextFormField(
                  validator: TValidator.validatePhone,
                  decoration: const InputDecoration(hintText: "60409020"),
                  focusNode: controller.phoneFocusNode,
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => controller.checkForm1IsValidate()
              ),
            )
          ],
        ),
      ],
    );
  }
}
