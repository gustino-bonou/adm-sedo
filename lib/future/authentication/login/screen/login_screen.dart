import 'package:adms/common/widget/buttons/button_component.dart';
import 'package:adms/common/widget/loader/loader.dart';
import 'package:adms/data/repositories/auth.repository.dart';
import 'package:adms/future/authentication/login/controller/login.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/padding/auth.padding.dart';
import '../../../../common/widget/text/underline.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController(authRepository: AuthRepository.instance));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Ask the user for confirmation before navigating back
          return true;

        // Return true if the user confirms, otherwise return false
      },
      child: Scaffold(
          body: Obx(() => Stack(
            children: [
              AuthScreenPadding(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: TSizes.screenHeight*0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                                child: SvgPicture.asset(
                                  TImages.logoSvg,
                                  height: TSizes.height50,
                                  color: TColor.kcPrimaryColor,
                                ))
                          ],
                        )
                    ),
                    Expanded(child:
                    SingleChildScrollView(
                      child: SizedBox(
                        height: TSizes.screenHeight*0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: TSizes.height20,),
                                      Text("Se connecter", style: Theme.of(context).textTheme.titleLarge,),

                                      UiHelper.verticalSpaceSmall,
                                      Text("Adresse email",
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
                                      const SizedBox(height: TSizes.tinySize,),
                                      TextFormField(
                                        validator: TValidator.validateEmail,
                                        decoration: const InputDecoration(hintText: "aite@gmail.com"),
                                        focusNode: controller.emailFocusNode,
                                        controller: controller.emailController,
                                        onChanged: (value) => controller.checkFormIsValidate(),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                      // Text("Numéro de téléphone",
                                      //     style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600)),
                                      // const SizedBox(height: TSizes.tinySize,),
                                      // Row(
                                      //   children: [
                                      //     MediaQuery.removePadding(
                                      //       removeLeft: true,
                                      //       removeRight: true,
                                      //       context: context,
                                      //       child: CountryCodePicker(
                                      //         showDropDownButton: true,
                                      //         flagWidth: 20,
                                      //         padding: const EdgeInsets.all(0),
                                      //         onChanged: (value) {
                                      //           controller.setCountryCode(value.dialCode);
                                      //         },
                                      //         initialSelection: controller.countryCode.value,
                                      //         favorite: const ['+229', '+228', 'FR', '+227'],
                                      //         showCountryOnly: false,
                                      //         showOnlyCountryWhenClosed: false,
                                      //         alignLeft: false,
                                      //         flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: TextFormField(
                                      //           validator: TValidator.validatePhone,
                                      //           decoration: const InputDecoration(hintText: "60409020"),
                                      //           focusNode: controller.phoneFocusNode,
                                      //           controller: controller.phoneController,
                                      //           keyboardType: TextInputType.phone,
                                      //           onChanged: (value) => controller.checkFormIsValidate()
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                      UiHelper.verticalSpaceSmall,
                                      Text("Mot de passe ", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w600
                                      )),
                                      const SizedBox(height: TSizes.tinySize,),
                                      Obx(() => TextFormField(
                                          obscureText: !controller.visiblePassword.value,
                                          validator: TValidator.validateEmail,
                                          decoration: InputDecoration(
                                            hintText: "***********",
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                controller.visiblePassword.value
                                                    ? Icons.visibility_outlined
                                                    : Icons.visibility_off_outlined,
                                                color: TColor.kcPrimaryColorDark.withOpacity(0.3),
                                              ),
                                              onPressed: () => controller.visiblePassword.toggle(),
                                            ),
                                          ),
                                          focusNode: controller.psFocusNode,
                                          controller: controller.passwordController,
                                          onChanged: (value) => controller.checkFormIsValidate()
                                      ),),
                                      const SizedBox(height: TSizes.smallSize,),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => controller.goToRegisterRoute(),
                                          child: UnderlinedText(
                                            text: "Créez un compte",
                                            fontSize: TSizes.ft12,
                                            color: TColor.kcPrimaryColor,
                                            underlineColor: TColor.kcPrimaryColor,
                                            underlineThickness: 2,
                                            paddingBottom: 6,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: TSizes.height30,
                                  top: TSizes.height10
                              ),
                              height: 50,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  Obx(() => SimpleButton(
                                    text: "Se connecter",
                                    canDoAction: controller.isValidForm.value,
                                    onPressed: () => controller.login(context),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              if (controller.isLoading.value)
                Positioned.fill(
                    child: TLoaders.loadingIndicator()
                ),
            ],
          ),)
      )
    );
  }
}
