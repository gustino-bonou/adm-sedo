import 'package:adms/common/widget/padding/auth.padding.dart';
import 'package:adms/future/authentication/register/controller/register.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/buttons/button_component.dart';
import '../../../../common/widget/loader/loader.dart';
import '../../../../common/widget/text/underline.dart';

class RegisterSecondScreen extends StatelessWidget {
  RegisterSecondScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
        children: [
          AuthScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: TSizes.screenHeight * 0.2,
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
                    )),
                Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: TSizes.screenHeight * 0.8,
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
                                      SizedBox(
                                        height: TSizes.height20,
                                      ),
                                      Text(
                                        "S'enregistrer",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      UiHelper.verticalSpaceSmall,
                                      Text("Mot de passe ", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          fontWeight: FontWeight.w600
                                      )),
                                      TextFormField(
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
                                          obscureText: !controller.visiblePassword.value,
                                          focusNode: controller.psFocusNode,
                                          controller: controller.passwordController,
                                          onChanged: (value) {
                                            controller.checkForm2IsValidate();
                                            controller.updateErrorMsg();
                                          }),
                                      Obx(() => Text(
                                        controller.formErrorMessage.value,
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: TColor.kcPrimaryColor,
                                            fontSize: 12
                                        ),
                                      )),
                                      UiHelper.verticalSpaceSmall,
                                      Text("Confirmer mot de passe",
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                              fontWeight: FontWeight.w600
                                          )),
                                      TextFormField(
                                          validator: TValidator.validateEmail,
                                          decoration:  InputDecoration(
                                              hintText: "***********",
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons.visibility_off_outlined,
                                                color: TColor.kcPrimaryColorDark.withOpacity(0.3),
                                              ),
                                              onPressed: () => true,
                                            ),
                                          ),
                                          obscureText: true,
                                          focusNode: controller.confirmPsFocusNode,
                                          controller: controller.confirmPasswordController,
                                          onChanged: (value) => controller.checkForm2IsValidate(),
                                      ),
                                      const SizedBox(
                                        height: TSizes.smallSize,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => controller.goToLoginRoute(),
                                          child: UnderlinedText(
                                            text: "Connectez-vous",
                                            fontSize: TSizes.ft12,
                                            color: TColor.kcPrimaryColor,
                                            underlineColor: TColor.kcPrimaryColor,
                                            underlineThickness: 2,
                                            paddingBottom: 6,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: TSizes.height50,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: TSizes.height30, top: TSizes.height10),
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  LinearBackButton(
                                    text: "Etape precedente",
                                    canDoAction: true,
                                    onPressed: () => Get.back(),

                                  ),
                                  const SizedBox(width: 5,),
                                  Obx(() => LineaNextButton(
                                    text: "Continuer",
                                    canDoAction: controller.isValidForm2.value,
                                    onPressed: () => controller.register(context),
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
      ))
    );
  }
}
