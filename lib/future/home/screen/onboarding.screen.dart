import 'package:adms/utils/helper/import.app.path.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/widget/buttons/button_component.dart';
import '../../../common/widget/padding/auth.padding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthScreenPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: kToolbarHeight + TSizes.height20
                  ),
                  child: SvgPicture.asset(
                    TImages.logoSvg,
                    height: TSizes.height50,
                    color: TColor.kcPrimaryColor,
                  ),
                )
            ),
            Column(
              children: [
                SvgPicture.asset(
                  TImages.onBoardingIllustration,
                  height: TSizes.screenHeight*0.4,
                ),
                UiHelper.verticalSpaceMedium,
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: "Bienvenue sur ", style: Theme.of(context).textTheme.titleMedium
                          ),
                          TextSpan(
                              text: "Sedo ", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: TColor.kcPrimaryColor)
                          ),
                          TextSpan(
                              text: "en tant que administrateur de ", style: Theme.of(context).textTheme.titleMedium
                          ),
                          TextSpan(
                              text: "Sedo", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: TColor.kcPrimaryColor)
                          ),
                        ]
                    ), textAlign: TextAlign.center
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: TSizes.height30
              ),
              child: Row(
                children: [
                  const Spacer(),
                  LineaNextButton(
                    text: "Continuer",
                    canDoAction: true,
                    onPressed: () => goToNamed(TRoute.register),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
