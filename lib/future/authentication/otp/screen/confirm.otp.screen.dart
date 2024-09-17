import 'package:adms/future/authentication/otp/controller/otp.controller.dart';
import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/widget/buttons/button_component.dart';
import '../../../../common/widget/loader/loader.dart';
import '../../../../common/widget/padding/auth.padding.dart';
import '../wdiget/custom.pint.put.dart';



class EnterOtpScreen extends GetView<OtpController> {
  const EnterOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  Text("Vérifier vos SMS", style: Theme.of(context).textTheme.titleLarge,),
                                  UiHelper.verticalSpaceSmall,
                                  Text("${"Nous avons envoyé un code de confirmation à l'email "}, ${controller.email.value}",
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        fontWeight: FontWeight.w500
                                    ),),
                                  UiHelper.verticalSpaceMedium,
                                  Center(child: SvgPicture.asset(TImages.enterOtpIllustration)),
                                  UiHelper.verticalSpaceMedium,
                                  CustomOtpField(
                                    pinValue: controller.pinValue,
                                    onCompleted: () => controller.sendOtp(context),
                                    onChanged: () {
                                      controller.setIsValidPin();
                                    },
                                  ),
                                  UiHelper.verticalSpaceMedium,
                                  Center(
                                    child: GestureDetector(
                                        onTap: () => controller.receiveOtpForEmail(),
                                        child: Text.rich(
                                            TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Vous n’avez recu aucun code ? ",
                                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: "Reenvoyer",
                                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                      decorationStyle: TextDecorationStyle.solid,
                                                      decorationThickness: 2,
                                                      decorationColor: TColor.kcPrimaryColor,
                                                      color: TColor.kcPrimaryColor,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 12,
                                                      decoration: TextDecoration.underline,
                                                    ),
                                                  ),
                                                ]
                                            )
                                        )
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LinearBackButton(
                                text: "Etape précédente",
                                canDoAction:true,
                                onPressed: () => Get.back(),
                              ),
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
          if (controller.isLoading.value )
            Positioned.fill(
              child: TLoaders.loadingIndicator()
            ),
        ],
      )),
    );
  }
}
