import 'package:adms/common/widget/padding/auth.padding.dart';
import 'package:adms/future/authentication/register/controller/register.controller.dart';
import 'package:adms/future/authentication/register/widget/register.firststep.form.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/buttons/button_component.dart';
import '../../../../common/widget/text/underline.dart';
import '../../../../data/repositories/auth.repository.dart';


class RegisterFirstScreen extends StatelessWidget {
   RegisterFirstScreen({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController(authRepository: AuthRepository.instance));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreenPadding(
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
                              Text("S'enregistrer", style: Theme.of(context).textTheme.titleLarge,),

                              UiHelper.verticalSpaceSmall,
                              const RegisterFirstStepForm(),
                              const SizedBox(height: TSizes.smallSize,),
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
                          Obx(() => LineaNextButton(
                            text: "Etape suivante",
                            canDoAction: controller.isValidForm1.value,
                            onPressed: () => controller.goToStep2(),
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
    );
  }
}
